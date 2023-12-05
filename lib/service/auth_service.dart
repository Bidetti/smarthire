import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smarthire/config.dart' as config;

const api = config.api;

Future<int> loginUser(String email, String password) async {
  const url = '$api/auth';
  try {
    final response = await http.post(
      Uri.parse(url),
      body: json.encode({
        'email': email,
        'senha': password,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final token = json.decode(response.body)['token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt', token);
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  } catch (e) {
    return 500;
  }
}

Future<void> logoutUser() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('jwt');
  await prefs.remove('id');
  await prefs.remove('tipo');
  await prefs.remove('email');
}

Future<String?> recoverPassword(String email) async {
  const url = '$api/auth/recover';
  final response = await http.post(
    Uri.parse(url),
    body: json.encode({
      'email': email,
    }),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    final userID = json.decode(response.body)['_id'];
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userID', userID);
    return 'Enviamos o código de recuperação para o seu email!';
  } else {
    return json.decode(response.body)['error'];
  }
}

Future<String?> verifyCode(String code) async {
  const url = '$api/auth/verify';
  final prefs = await SharedPreferences.getInstance();
  final userID = prefs.getString('userID');
  final response = await http.post(
    Uri.parse(url),
    body: json.encode({
      'userID': userID,
      'code': code,
    }),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    return 'Código de verificação correto!';
  } else {
    return json.decode(response.body)['error'];
  }
}

Future<String?> resetPassword(String password) async {
  const url = '$api/auth/resetPassword';
  final prefs = await SharedPreferences.getInstance();
  final userID = prefs.getString('userID');
  final response = await http.post(
    Uri.parse(url),
    body: json.encode({
      'userID': userID,
      'password': password,
    }),
    headers: {'Content-Type': 'application/json'},
  );
  if (response.statusCode == 200) {
    return 'Senha alterada com sucesso!';
  } else {
    // Senha não alterada
    return json.decode(response.body)['error'];
  }
}

Future<bool> verifyJWT() async {
  const url = '$api/auth/verifyjwt';
  final prefs = await SharedPreferences.getInstance();
  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${prefs.getString('jwt')}',
    },
  );
  final body = json.decode(response.body);

  if (response.statusCode == 200) {
    return body['jwt'];
  } else {
    return false;
  }
}

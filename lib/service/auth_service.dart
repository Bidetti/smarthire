import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const api = 'http://localhost:5523/api';

// Função para registrar um usuário (obrigatorios: nome, cpf, email, senha, endereço, tipo | opcionais: telefone, dataNascimento, rg, fotourl)
Future<String?> registerUser(String nome, String cpf, String email, String senha, String endereco, String tipo, {String? telefone, String? dataNascimento, String? rg, String? fotourl}) async {
  const url = '$api/user';
  final response = await http.post(
    Uri.parse(url),
    body: json.encode({
      'nome': nome,
      'cpf': cpf,
      'email': email,
      'senha': senha,
      'endereco': endereco,
      'tipo': tipo,
      'telefone': telefone,
      'dataNascimento': dataNascimento,
      'rg': rg,
      'fotourl': fotourl,
    }),
    headers: {'Content-Type': 'application/json'},
  );
  if (response.statusCode == 200) {
    // Registro bem-sucedido
    return 'Registro bem-sucedido!';
  } else {
    // Registro falhou
    return json.decode(response.body)['error'];
  }
}

Future<String?> loginUser(String email, String password) async {
  const url = '$api/auth';
  final response = await http.post(
    Uri.parse(url),
    body: json.encode({
      'email': email,
      'senha': password,
    }),
    headers: {'Content-Type': 'application/json'},
  );
  if (response.statusCode == 200) {
    // Login bem-sucedido
    final token = json.decode(response.body)['token'];
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', token);
    return null;
  } else {
    // Login falhou
    return json.decode(response.body)['error'];
    
  }
}

Future<void> logoutUser() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('jwt');
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
    // Email não enviado
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
    // Senha não alterada
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
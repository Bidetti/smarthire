import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// Função para registrar um usuário
Future<void> registerUser(String email, String password) async {
  final url = 'http://seu-servidor.com/registro';
  final response = await http.post(
    Uri.parse(url),
    body: json.encode({
      'email': email,
      'password': password,
    }),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    // Registro bem-sucedido
  } else {
    // Registro falhou
  }
}

Future<void> loginUser(String email, String password) async {
  final url = 'http://seu-servidor.com/login';
  final response = await http.post(
    Uri.parse(url),
    body: json.encode({
      'email': email,
      'password': password,
    }),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    // Login bem-sucedido
    final token = json.decode(response.body)['token'];
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', token);
  } else {
    // Login falhou
    
  }
}
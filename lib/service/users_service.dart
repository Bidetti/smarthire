import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> getUserByEmail(String email) async {
  final url = 'http://localhost:5523/api/users/$email';
  final response = await http.get(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    // Login bem-sucedido
    return json.decode(response.body);
  } else {
    // Login falhou
    return jsonDecode(response.body);
  }
}
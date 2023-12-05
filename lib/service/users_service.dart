import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smarthire/config.dart' as config;

const api = config.api;

Future<String?> registerUser(String nome, String cpf, String email,
    String senha, String endereco, String tipo,
    {String? telefone,
    String? dataNascimento,
    String? rg,
    String? fotourl}) async {
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
    return 'Registro bem-sucedido!';
  } else {
    return json.decode(response.body)['error'];
  }
}

// GetUserByID

Future<Map<String, dynamic>?> getUserByID(String id) async {
  final url = '$api/user/id/$id';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return null;
  }
}

Future<Map<String, dynamic>?> getUserByEmail(String email) async {
  final url = '$api/user/email/$email';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return null;
  }
}

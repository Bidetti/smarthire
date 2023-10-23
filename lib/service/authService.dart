import 'package:http/http.dart' as http;

class MyHttpService {
  final String baseUrl; // A URL base para suas requisições

  MyHttpService(this.baseUrl);

  Future<http.Response> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Falha na requisição: ${response.reasonPhrase}');
    }
  }
}

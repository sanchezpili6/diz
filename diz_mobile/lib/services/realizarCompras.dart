import 'package:http/http.dart' as http;

registrarCompra(json) async {
  final String apiURL = 'http://35.239.19.77:8000/compras/';
  Map<String, String> headers = {"Content-type": "application/json"};
  final response = await http.post(apiURL, headers: headers, body: json);
  print(response.body);
  print(response.statusCode);
  return response.statusCode;
}

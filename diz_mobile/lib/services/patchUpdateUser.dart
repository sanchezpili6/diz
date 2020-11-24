import 'package:diz/services/registro.dart';
import 'package:http/http.dart';
makePatchRequest(user) async {
  // set up PATCH request arguments
  String url = 'http://35.239.19.77:8000/clients/$uid/';
  Map<String, String> headers = {"Content-type": "application/json"};
  Response response = await patch(url, headers: headers, body: user);
  // check the status code for the result
  int statusCode = response.statusCode;
  return statusCode;
}
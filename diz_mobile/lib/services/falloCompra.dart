import 'package:diz/services/registro.dart';
import 'package:http/http.dart';

makePostFail() async {
  // set up POST request arguments
  String url = 'https://diz-marketing.herokuapp.com/PAYMENT_ERROR';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"email": "$correo","name": "$nombrePila" }';
  // make POST request
  Response response = await post(url, headers: headers, body: json);
  // check the status code for the result
  int statusCode = response.statusCode;
  return statusCode;
}

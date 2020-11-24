import 'package:http/http.dart';

makeDeleteRequest(uid) async {
  // post 1
  String url = 'http://35.239.19.77:8000/clients/$uid/';
  // make DELETE request
  Response response = await delete(url);
  // check the status code for the result
  int statusCode = response.statusCode;
  return statusCode;
}
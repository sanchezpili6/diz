import 'package:http/http.dart';

makePostRequestUpdate(uid, newPassword, token) async {
  // set up POST request arguments
  String url = 'https://signonservice-difbz2ztya-uc.a.run.app/updatepassword';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"uid": "$uid", "newPassword": "$newPassword", "token": "$token"}';
  // make POST request
  Response response = await post(url, headers: headers, body: json);
  // check the status code for the result
  int statusCode = response.statusCode;
  return statusCode;
}
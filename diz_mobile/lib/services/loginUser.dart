import 'dart:convert';
import 'package:diz/services/registro.dart';
import 'package:http/http.dart';

makePostRequest(mail, password) async {
  // set up POST request arguments
  String url = 'https://signonservice-difbz2ztya-uc.a.run.app/oauth';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"email": "$mail", "password": "$password"}';
  // make POST request
  Response response = await post(url, headers: headers, body: json);
  // check the status code for the result
  int statusCode = response.statusCode;
  String body = response.body;
  Map<String, dynamic> user = jsonDecode(body);
  if(statusCode==201){
    token=user['token'];
    uid=user['uid'];
    logged=true;
    correo=mail;
    print(uid+'Exito');
  }
  return statusCode;
}
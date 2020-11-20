import 'dart:convert';
import 'package:http/http.dart';

hashPaswordRequest(password) async {
  // make GET request
  String url = 'https://hash-lbetwuukaq-uc.a.run.app/hash/$password';
  Response response = await get(url);
  // sample info available in response
  String json = response.body;
  Map<String, dynamic> user = jsonDecode(json);
  return user['Password'];
}
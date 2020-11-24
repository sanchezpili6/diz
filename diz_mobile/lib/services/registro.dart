import 'package:diz/services/RegisterUser.dart';
import 'package:diz/services/loginUser.dart';
import 'package:http/http.dart' as http;
//nombrePila, apellidoPat, apellidoMat, fechaNac, genero,
// CLienteInfo:  telefono correo noTarjeta, mesTarjeta, anioTarjeta, calle, colonia, ciudad, cp estado, entreCalles,
String correo='', contrasena='', telefono='', nombrePila='', apellidoP='', apellidoM='', genero='', uid='';
DateTime cumple;
bool logged, isDeleted;
String calle='', colonia='', ciudad='',cp='',estado='', entreCalles='';
String nTarjeta='', mTarjeta='', aTarjeta='';
bool isMain;
var token;
List<ClienteInfo> clienteInfo=[];
List<dynamic> compra=[];

Future<int> registerUser(user) async {
  String url = 'http://35.239.19.77:8000/clients/';
  Map<String, String> headers = {"Content-type": "application/json"};
  final response = await http.post(url, headers: headers, body: user);

  if (response.statusCode == 201) {
    makePostRequest(correo, contrasena);
    //print("Status = " + response.statusCode.toString());
  } else {
    //print("Status = " + response.statusCode.toString());
  }
  return response.statusCode;
}
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:diz/services/registro.dart';

makeGetRequestUserInfo(id) async {
  // make GET request
  print(id);
  var response = await http.get('http://35.239.19.77:8000/clients/$uid/',headers: {HttpHeaders.contentTypeHeader: 'application/json'});
  // sample info available in response
  print(response.statusCode);
  //print(response.body);
  //202 bueno
  if(response.statusCode==202){
    String json = response.body;
    Map<String, dynamic> user = jsonDecode(json);
    //nombrePila, apellidoPat, apellidoMat, fechaNac, genero,
    // CLienteInfo:  telefono correo noTarjeta, mesTarjeta, anioTarjeta, calle, colonia, ciudad, cp estado, entreCalles,
    nombrePila=user['nombrePila']; apellidoP=user['apellidoPat']; apellidoM=user['apellidoMat']; genero=user['genero'];
    cumple=cumple=DateTime.parse(user['fechaNac']);
    telefono=user['clienteInfo'][0]['telefono']; correo=user['clienteInfo'][0]['correo'];
    calle=user['clienteInfo'][0]['calle']; colonia=user['clienteInfo'][0]['colonia']; ciudad=user['clienteInfo'][0]['ciudad'];
    cp=user['clienteInfo'][0]['cp'];estado=user['clienteInfo'][0]['estado']; entreCalles=user['clienteInfo'][0]['entreCalles'];
    return user;
  }
  else{
    return null;
  }
}
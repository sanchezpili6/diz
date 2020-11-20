// To parse this JSON data, do
//
//     final registerUser = registerUserFromJson(jsonString);

import 'dart:convert';

RegisterUser registerUserFromJson(String str) => RegisterUser.fromJson(json.decode(str));

String registerUserToJson(RegisterUser data) => json.encode(data.toJson());

class RegisterUser {
  RegisterUser({
    this.contrasena,
    this.cliente,
    this.clienteInfo,
  });

  String contrasena;
  Cliente cliente;
  ClienteInfo clienteInfo;

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
    contrasena: json["contrasena"],
    cliente: Cliente.fromJson(json["cliente"]),
    clienteInfo: ClienteInfo.fromJson(json["clienteInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "contrasena": contrasena,
    "cliente": cliente.toJson(),
    "clienteInfo": clienteInfo.toJson(),
  };
}

class Cliente {
  Cliente({
    this.nombrePila,
    this.apellidoPat,
    this.apellidoMat,
    this.fechaNac,
    this.genero,
  });

  String nombrePila;
  String apellidoPat;
  String apellidoMat;
  DateTime fechaNac;
  String genero;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
    nombrePila: json["nombrePila"],
    apellidoPat: json["apellidoPat"],
    apellidoMat: json["apellidoMat"],
    fechaNac: DateTime.parse(json["fechaNac"]),
    genero: json["genero"],
  );

  Map<String, dynamic> toJson() => {
    "nombrePila": nombrePila,
    "apellidoPat": apellidoPat,
    "apellidoMat": apellidoMat,
    "fechaNac": "${fechaNac.year.toString().padLeft(4, '0')}-${fechaNac.month.toString().padLeft(2, '0')}-${fechaNac.day.toString().padLeft(2, '0')}",
    "genero": genero,
  };
}

class ClienteInfo {
  ClienteInfo({
    this.telefono,
    this.correo,
  });

  String telefono;
  String correo;

  factory ClienteInfo.fromJson(Map<String, dynamic> json) => ClienteInfo(
    telefono: json["telefono"],
    correo: json["correo"],
  );

  Map<String, dynamic> toJson() => {
    "telefono": telefono,
    "correo": correo,
  };
}
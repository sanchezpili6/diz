// To parse this JSON data, do
//
//     final updateUserModel = updateUserModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UpdateUserModel updateUserModelFromJson(String str) => UpdateUserModel.fromJson(json.decode(str));

String updateUserModelToJson(UpdateUserModel data) => json.encode(data.toJson());

class UpdateUserModel {
  UpdateUserModel({
    @required this.cliente,
    @required this.clienteInfo,
  });

  Cliente cliente;
  ClienteInfo clienteInfo;

  factory UpdateUserModel.fromJson(Map<String, dynamic> json) => UpdateUserModel(
    cliente: Cliente.fromJson(json["cliente"]),
    clienteInfo: ClienteInfo.fromJson(json["clienteInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "cliente": cliente.toJson(),
    "clienteInfo": clienteInfo.toJson(),
  };
}

class Cliente {
  Cliente({
    @required this.nombrePila,
    @required this.apellidoPat,
    @required this.apellidoMat,
    @required this.fechaNac,
    @required this.genero,
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
    @required this.telefono,
    @required this.correo,
    @required this.noTarjeta,
    @required this.mesTarjeta,
    @required this.anioTarjeta,
    @required this.calle,
    @required this.colonia,
    @required this.ciudad,
    @required this.cp,
    @required this.estado,
    @required this.entreCalles,
  });

  String telefono;
  String correo;
  String noTarjeta;
  String mesTarjeta;
  String anioTarjeta;
  String calle;
  String colonia;
  String ciudad;
  String cp;
  String estado;
  String entreCalles;

  factory ClienteInfo.fromJson(Map<String, dynamic> json) => ClienteInfo(
    telefono: json["telefono"],
    correo: json["correo"],
    noTarjeta: json["noTarjeta"],
    mesTarjeta: json["mesTarjeta"],
    anioTarjeta: json["anioTarjeta"],
    calle: json["calle"],
    colonia: json["colonia"],
    ciudad: json["ciudad"],
    cp: json["cp"],
    estado: json["estado"],
    entreCalles: json["entreCalles"],
  );

  Map<String, dynamic> toJson() => {
    "telefono": telefono,
    "correo": correo,
    "noTarjeta": noTarjeta,
    "mesTarjeta": mesTarjeta,
    "anioTarjeta": anioTarjeta,
    "calle": calle,
    "colonia": colonia,
    "ciudad": ciudad,
    "cp": cp,
    "estado": estado,
    "entreCalles": entreCalles,
  };
}

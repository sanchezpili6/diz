import 'dart:convert';

DeleteUser deleteUserFromJson(String str) => DeleteUser.fromJson(json.decode(str));

String deleteUserToJson(DeleteUser data) => json.encode(data.toJson());

class DeleteUser {
  DeleteUser({
    this.id,
    this.nombrePila,
    this.apellidoPat,
    this.apellidoMat,
    this.fechaNac,
    this.genero,
    this.isDeleted,
    this.clienteInfo,
    this.compra,
  });

  int id;
  String nombrePila;
  String apellidoPat;
  String apellidoMat;
  DateTime fechaNac;
  String genero;
  bool isDeleted;
  List<ClienteInfo> clienteInfo;
  List<dynamic> compra;

  factory DeleteUser.fromJson(Map<String, dynamic> json) => DeleteUser(
    id: json["id"],
    nombrePila: json["nombrePila"],
    apellidoPat: json["apellidoPat"],
    apellidoMat: json["apellidoMat"],
    fechaNac: DateTime.parse(json["fechaNac"]),
    genero: json["genero"],
    isDeleted: json["is_deleted"],
    clienteInfo: List<ClienteInfo>.from(json["clienteInfo"].map((x) => ClienteInfo.fromJson(x))),
    compra: List<dynamic>.from(json["compra"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombrePila": nombrePila,
    "apellidoPat": apellidoPat,
    "apellidoMat": apellidoMat,
    "fechaNac": "${fechaNac.year.toString().padLeft(4, '0')}-${fechaNac.month.toString().padLeft(2, '0')}-${fechaNac.day.toString().padLeft(2, '0')}",
    "genero": genero,
    "is_deleted": isDeleted,
    "clienteInfo": List<dynamic>.from(clienteInfo.map((x) => x.toJson())),
    "compra": List<dynamic>.from(compra.map((x) => x)),
  };
}

class ClienteInfo {
  ClienteInfo({
    this.telefono,
    this.correo,
    this.calle,
    this.colonia,
    this.ciudad,
    this.cp,
    this.estado,
    this.entreCalles,
    this.isMain,
  });

  String telefono;
  String correo;
  String calle;
  String colonia;
  String ciudad;
  String cp;
  String estado;
  String entreCalles;
  bool isMain;

  factory ClienteInfo.fromJson(Map<String, dynamic> json) => ClienteInfo(
    telefono: json["telefono"],
    correo: json["correo"],
    calle: json["calle"],
    colonia: json["colonia"],
    ciudad: json["ciudad"],
    cp: json["cp"],
    estado: json["estado"],
    entreCalles: json["entreCalles"],
    isMain: json["is_main"],
  );

  Map<String, dynamic> toJson() => {
    "telefono": telefono,
    "correo": correo,
    "calle": calle,
    "colonia": colonia,
    "ciudad": ciudad,
    "cp": cp,
    "estado": estado,
    "entreCalles": entreCalles,
    "is_main": isMain,
  };
}
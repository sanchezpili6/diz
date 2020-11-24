// To parse this JSON data, do
//
//     final billModel = billModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BillModel billModelFromJson(String str) => BillModel.fromJson(json.decode(str));

String billModelToJson(BillModel data) => json.encode(data.toJson());

class BillModel {
  BillModel({
    @required this.compraId,
    @required this.rfc,
    @required this.razonSocial,
    @required this.correo,
    @required this.telefono,
    @required this.calle,
    @required this.numero,
    @required this.colonia,
    @required this.ciudad,
    @required this.cp,
    @required this.estado,
    @required this.entreCalles,
  });

  int compraId;
  String rfc;
  String razonSocial;
  String correo;
  String telefono;
  String calle;
  String numero;
  String colonia;
  String ciudad;
  String cp;
  String estado;
  String entreCalles;

  factory BillModel.fromJson(Map<String, dynamic> json) => BillModel(
    compraId: json["compra_id"],
    rfc: json["RFC"],
    razonSocial: json["razonSocial"],
    correo: json["correo"],
    telefono: json["telefono"],
    calle: json["calle"],
    numero: json["numero"],
    colonia: json["colonia"],
    ciudad: json["ciudad"],
    cp: json["cp"],
    estado: json["estado"],
    entreCalles: json["entreCalles"],
  );

  Map<String, dynamic> toJson() => {
    "compra_id": compraId,
    "RFC": rfc,
    "razonSocial": razonSocial,
    "correo": correo,
    "telefono": telefono,
    "calle": calle,
    "numero": numero,
    "colonia": colonia,
    "ciudad": ciudad,
    "cp": cp,
    "estado": estado,
    "entreCalles": entreCalles,
  };
}

// To parse this JSON data, do
//
//     final purchaseModel = purchaseModelFromJson(jsonString);

import 'dart:convert';

PurchaseModel purchaseModelFromJson(String str) =>
    PurchaseModel.fromJson(json.decode(str));

String purchaseModelToJson(PurchaseModel data) => json.encode(data.toJson());

class PurchaseModel {
  PurchaseModel({
    this.id,
    this.compra,
    this.pedido,
  });

  int id;
  Compra compra;
  List<Pedido> pedido;

  factory PurchaseModel.fromJson(Map<String, dynamic> json) => PurchaseModel(
        id: json["id"],
        compra: Compra.fromJson(json["compra"]),
        pedido:
            List<Pedido>.from(json["pedido"].map((x) => Pedido.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "compra": compra.toJson(),
        "pedido": List<dynamic>.from(pedido.map((x) => x.toJson())),
      };
}

class Compra {
  Compra({
    this.noTarjeta,
    this.mesTarjeta,
    this.anioTarjeta,
    this.total,
    this.calle,
    this.numero,
    this.colonia,
    this.ciudad,
    this.cp,
    this.estado,
    this.entreCalles,
  });

  String noTarjeta;
  String mesTarjeta;
  String anioTarjeta;
  String total;
  String calle;
  String numero;
  String colonia;
  String ciudad;
  String cp;
  String estado;
  String entreCalles;

  factory Compra.fromJson(Map<String, dynamic> json) => Compra(
        noTarjeta: json["noTarjeta"],
        mesTarjeta: json["mesTarjeta"],
        anioTarjeta: json["anioTarjeta"],
        total: json["total"],
        calle: json["calle"],
        numero: json["numero"],
        colonia: json["colonia"],
        ciudad: json["ciudad"],
        cp: json["cp"],
        estado: json["estado"],
        entreCalles: json["entreCalles"],
      );

  Map<String, dynamic> toJson() => {
        "noTarjeta": noTarjeta,
        "mesTarjeta": mesTarjeta,
        "anioTarjeta": anioTarjeta,
        "total": total,
        "calle": calle,
        "numero": numero,
        "colonia": colonia,
        "ciudad": ciudad,
        "cp": cp,
        "estado": estado,
        "entreCalles": entreCalles,
      };
}

class Pedido {
  Pedido({
    this.codigoProducto,
    this.cantidadProducto,
    this.precioProducto,
  });

  String codigoProducto;
  String cantidadProducto;
  String precioProducto;

  factory Pedido.fromJson(Map<String, dynamic> json) => Pedido(
        codigoProducto: json["codigoProducto"],
        cantidadProducto: json["cantidadProducto"],
        precioProducto: json["precioProducto"],
      );

  Map<String, dynamic> toJson() => {
        "codigoProducto": codigoProducto,
        "cantidadProducto": cantidadProducto,
        "precioProducto": precioProducto,
      };
}

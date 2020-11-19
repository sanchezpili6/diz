// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.noTarjeta,
    this.mesTarjeta,
    this.anioTarjeta,
  });

  String noTarjeta;
  String mesTarjeta;
  String anioTarjeta;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        noTarjeta: json["noTarjeta"],
        mesTarjeta: json["mesTarjeta"],
        anioTarjeta: json["anioTarjeta"],
      );

  Map<String, dynamic> toJson() => {
        "noTarjeta": noTarjeta,
        "mesTarjeta": mesTarjeta,
        "anioTarjeta": anioTarjeta,
      };
}

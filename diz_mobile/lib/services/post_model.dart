import 'package:flutter/foundation.dart';

class Post {
  final String codigo;
  final String colonia;
  final String municipio;
  final String estado;

  Post(
      {@required this.codigo,
      @required this.colonia,
      @required this.municipio,
      @required this.estado});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      codigo: json['codigo'] as String,
      colonia: json['colonia'] as String,
      municipio: json['municipio'] as String,
      estado: json['estado'] as String,
    );
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

class Album {
  final String codigo;
  final String colonia;
  final String municipio;
  final String estado;

  Album({
    this.codigo,
    this.colonia,
    this.municipio,
    this.estado,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      codigo: json['codigo'],
      colonia: json['colonia'],
      municipio: json['municipio'],
      estado: json['estado'],
    );
  }
}

Future<Album> fetchAlbum() async {
  final response =
      await http.get("http://35.239.19.77:8000/directions/get?cp=50210");
  //print("Entra await");
  if (response.statusCode == 302) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

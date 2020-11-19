import 'dart:convert';
//import 'dart:io';

import 'package:flutter/foundation.dart';



class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final String imgUrl;
  final double price;



  Product(
      {@required this.id,
        @required this.name,
        @required this.description,
        @required this.imgUrl,
        @required this.price});

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: (json['idProducto']).toString(),
      name: json['nombre'],
      description: json['descripcion'],
      imgUrl: json['url'],
      price: double.parse(json['precioVenta']),
    );
  }
}

class Products with ChangeNotifier {



  List<Product> _items = [
   /* Product.fromJson(jsonDecode(r'''{
idProducto: 50,
nombre: "Lavadora Samsung",
descripcion: "Lavadora Samsung 18 kg gris claro WT18K5200MB/AX",
url: "https://tinyurl.com/y5aqnu82",
precioVenta: "11000"
}'''))*/
  ];


  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((pdt) => pdt.id == id);
  }
}
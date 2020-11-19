import 'package:flutter/foundation.dart';



class Product with ChangeNotifier {
  final String id;
  final String category;
  final String name;
  final String description;
  final String imgUrl;
  final double price;

  Product(
      {@required this.id,
        @required this.category,
        @required this.name,
        @required this.description,
        @required this.imgUrl,
        @required this.price});

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'],
      category: json['idDepto'],
      name: json['name'],
      description: json['descripcion'],
      imgUrl: json['url'],
      price: json['PrecioVenta'],
    );
  }
}


class Products with ChangeNotifier  {
  Future <List<Product>> initProducts () async{
    List<Product> productsList = [];
    var url = 'https://mod3-jafjdugfba-uc.a.run.app/departamento/4';

  }



  List<Product> _items = [];


  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((pdt) => pdt.id == id);
  }

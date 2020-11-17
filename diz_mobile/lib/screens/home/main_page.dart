import 'package:diz/screens/home/products.dart';
import 'package:diz/widgets/allProducts.dart';
import 'package:diz/widgets/departamentosMainPageHorizontalScroll.dart';
import 'package:diz/widgets/hamburguesita/navDrawerMenuPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:diz/screens/cart_screen.dart';
import 'package:diz/models/productsK.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  List<Product> _products = List<Product>();

  Future <List<Product>> fetchProducts() async {
    var url = 'https://jsonplaceholder.typicode.com/albums/';
    var response = await http.get(url);
    var products = List<Product>();
    if (response.statusCode == 200) {
      var prodsJson = json.decode(response.body);
      for(var productJson in prodsJson){
        products.add(Product.fromJson(productJson));
      }

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Product');
    }
    return products;
  }

//return Product.fromJson(jsonDecode(response.body));
  @override
  void initState() {
    fetchProducts().then((value) {
      setState(() {
        _products.addAll(value);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){} ,
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: ()=>Navigator.of(context).pushNamed(CartScreen.routeName),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              "Categorías",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Departamentos(),
          Container(
            height: 600.0,
            child: AllProducts(),
          )
        ],
      ),
    );
  }
}


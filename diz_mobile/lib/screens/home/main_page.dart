import 'package:diz/widgets/allProducts.dart';
import 'package:diz/widgets/departamentosMainPageHorizontalScroll.dart';
import 'package:diz/widgets/hamburguesita/navDrawerMenuPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:diz/screens/cart_screen.dart';

class MainPage extends StatelessWidget{
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                "Productos",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Column(
                children: [
                  AllProducts(cat: 1),
                  AllProducts(cat: 2),
                  AllProducts(cat: 3),
                  AllProducts(cat: 4),
                  AllProducts(cat: 5),
                  AllProducts(cat: 6),
                  AllProducts(cat: 7),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


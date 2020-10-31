import 'package:flutter/material.dart';
import 'package:diz/constants.dart';
import 'package:diz/home/body.dart';
import 'package:diz/widgets/menuPrincipal.dart';
import 'package:diz/Products/details_screen.dart';

class MainPage extends StatelessWidget {
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
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: (){},
          ),
        ],
      ),
      body: Body(),
    );
  }
}
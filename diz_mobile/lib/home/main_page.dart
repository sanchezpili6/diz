import 'package:flutter/material.dart';
import 'package:diz/constants.dart';
import 'package:diz/home/body.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){},
        ),
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
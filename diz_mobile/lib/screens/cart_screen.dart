import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart', style:TextStyle(
          fontSize: 30, color: Theme.of(context).accentColor
        ),),
      ),
      body: Column (
        children: <Widget> [
          ListView.builder(itemBuilder: null),
          FlatButton(onPressed: () {}, child: Text('Checkout', style:
          TextStyle(color: Colors.blue, fontSize: 20),))
        ],
      )
    );
  }

}
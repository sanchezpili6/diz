import 'package:flutter/material.dart';
import 'package:diz_app/components/products.dart';

void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Subproducts(),
      )
  );
}

class Subproducts extends StatefulWidget{
  @override
  _SubProductsState createState() => _SubProductsState();
}

class _SubProductsState extends State<Subproducts>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.red,
          title: Text('Diz'),
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: (){})
          ],
        ),

        drawer: new Drawer(
            child: new ListView(
                children: <Widget>[

                ]
            )
        ),

        body: new ListView(
          children: <Widget>[
            new Padding(padding: const EdgeInsets.all(15.0),
              child: new Text('Productos parecidos'),),

            Container(
              height: 600.0,
              child: Products(),
            )
          ],
        )
    );
  }
}
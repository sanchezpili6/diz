import 'package:diz/screens/cart_screen.dart';
import 'package:diz/widgets/allProducts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Department extends StatefulWidget {
  final int dep;
  final Text department;
  final Color colour;
  final Color bckColour;
  Department({@required this.department, this.colour, this.bckColour, @required this.dep});
  @override
  _DepartmentState createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        title: Text(
          widget.department.data,
          style: TextStyle(color: widget.colour),
        ),
        backgroundColor: widget.bckColour,
      ),*/
      appBar: AppBar(
        backgroundColor: Colors.black87,

        elevation: 0,
        actions: <Widget>[
          /*IconButton(
            icon: Icon(Icons.search),
            onPressed: (){} ,
          ),*/
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: ()=>Navigator.of(context).pushNamed(CartScreen.routeName),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Text(
                          "Bienvenido(a) al departamento de " + widget.department.data,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: widget.colour == Color(0xFFFFFFFF)? Colors.black: widget.colour,
                            fontSize: 22.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      child: AllProducts(cat: widget.dep),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}


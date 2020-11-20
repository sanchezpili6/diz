import 'package:diz/screens/cart_screen.dart';
import 'package:diz/services/registro.dart';
import 'package:diz/widgets/hamburguesita/navDrawerMenuPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAccountScreen extends StatefulWidget {
  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Center(
                child: Text('MI CUENTA',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                        fontStyle: FontStyle.italic,
                    ),
                ),
              ),
            ),
            Container(
              child: Text('Correo: '+correo),
            ),
          ],
        ),
      ),
    );
  }
}

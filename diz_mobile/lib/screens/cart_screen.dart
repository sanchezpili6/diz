import 'package:diz/screens/payment/user_data.dart';
import 'package:diz/screens/welcome/welcome_screen.dart';
import 'package:diz/services/cart.dart';
import 'package:diz/services/obtenerDatosUsuario.dart';
import 'package:diz/services/registro.dart';
import 'package:flutter/material.dart';
import 'package:diz/models/ordersK.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Mi Carrito',
            style: GoogleFonts.sanchez(fontSize: 25, color: Colors.white)),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => CartPdt(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].cantidad,
                    cart.items.values.toList()[i].name)),
          ),
          CheckoutButton(
            cart: cart,
            context: context,
          ),
          //FlatButton(
          //     onPressed: () {
          //   },
          //    child: Text(
          //       'Checkout',
          //     style: TextStyle(color: Colors.blue, fontSize: 20),
          //    ))
        ],
      ),
    );
  }
}

class CheckoutButton extends StatefulWidget {
  final Cart cart;
  final context;
  const CheckoutButton({@required this.cart, this.context});
  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.blue,
      child: Text('Checkout',
          style: GoogleFonts.sanchez(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white)),
      onPressed: () async {
        await makeGetRequestUserInfo(uid);
        if (logged == true) {
          getCart(widget.cart, context);
          print(widget.cart.items.length);
          if (widget.cart.items.length == 0) {
            showDialog(
                context: context,
                builder: (buildcontext) {
                  return AlertDialog(
                    title: Text("CARRITO VACÍO:("),
                    content:
                        Text("Regresa a disfrutar de la experiencia de Diz"),
                    actions: <Widget>[
                      RaisedButton(
                        color: Colors.blue,
                        child: Text(
                          "REGRESAR",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                });
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FormScreen();
                },
              ),
            );
          }
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()));
        }
      },
      /*widget.cart.totalAmount <= 0
          ? null
          //async working with server
          : () async {
              await Provider.of<Orders>(context, listen: false).addOrder(
                  widget.cart.items.values.toList(), widget.cart.totalAmount);
              widget.cart.clear();
            },*/
    );
  }
}

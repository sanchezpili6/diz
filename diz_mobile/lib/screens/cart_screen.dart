import 'package:diz/screens/payment/user_data.dart';
import 'package:diz/services/cart.dart';
import 'package:flutter/material.dart';
import 'package:diz/models/ordersK.dart';
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
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 30, color: Theme.of(context).accentColor),
        ),
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
      child: Text('Checkout'),
      onPressed: () {
        getCart(widget.cart, context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return FormScreen();
            },
          ),
        );
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

import 'package:diz/payment_screens/credit_card.dart';
import 'package:flutter/material.dart';
class CardPyScreen extends StatelessWidget{
  final numeroT;
  final venc;

  CardPyScreen({
    this.numeroT,
    this.venc
  });

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
        backgroundColor: Colors.white,
        body: new ListView(
          children: <Widget>[
            new Padding(padding: const EdgeInsets.all(15.0),
                child: new Text('¿Son tus datos correctos?', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
            Center(
              child: CreditCard(numeroTarjeta: numeroT, vencimiento: venc),
            ),
            SizedBox(height: 100),
            RaisedButton(
              child: Text(
                'Confirmar compra',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            )
          ],
        )

    );
  }
}
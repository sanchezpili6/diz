import 'package:diz/screens/payment/card_screen.dart';
import 'package:diz/widgets/hamburguesita/navDrawerMenuPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../cart_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CardScreen(),
  ));
}

class CardScreen extends StatefulWidget {
  @override
  /*State<StatefulWidget> createState(){
    return CardScreenState();
  }*/
  CardScreenState createState() => CardScreenState();
}

class CardScreenState extends State<CardScreen> {
  String _titular;
  String _numeroTarjeta;
  String _vencimiento_month;
  String _vencimiento_year;
  String _cv;

  //final GlobalKey<_PayScreenState> _formKey = GlobalKey<_PayScreenState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNombre() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Titular de la tarjeta'),
      maxLength: 50,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Dato requerido';
        }
        return null;
      },
      onSaved: (String value) {
        _titular = value;
      },
    );
  }

  Widget _buildNumero() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Numero tarjeta'),
      maxLength: 16,
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Dato requerido';
        }
        if (value.length < 16) {
          return 'Numero invalido';
        }
        return null;
      },
      onSaved: (String value) {
        _numeroTarjeta = value;
      },
    );
  }

  Widget _buildVencimientoM() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Fecha vencimiento (MM)'),
      maxLength: 2,
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Dato requerido';
        }
        if (value.length < 2) {
          return 'Fecha invalida';
        }
        return null;
      },
      onSaved: (String value) {
        _vencimiento_month = value;
      },
    );
  }

  Widget _buildVencimientoY() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Fecha vencimiento (YY)'),
      maxLength: 2,
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Dato requerido';
        }
        if (value.length < 2) {
          return 'Fecha invalida';
        }
        return null;
      },
      onSaved: (String value) {
        _vencimiento_year = value;
      },
    );
  }

  Widget _buildCV() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'CV'),
      maxLength: 3,
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Dato requerido';
        }
        if (value.length < 3) {
          return 'CV invalido';
        }
        return null;
      },
      onSaved: (String value) {
        _cv = value;
      },
    );
  }

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
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () =>
                    Navigator.of(context).pushNamed(CartScreen.routeName),
              ),
            ]),
        body: new ListView(
          children: <Widget>[
            new Padding(
                padding: const EdgeInsets.all(15.0),
                child: new Text('Datos de pago',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
            Container(),
            Container(
              margin: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildNombre(),
                    _buildNumero(),
                    Row(children: <Widget>[
                      Expanded(
                        child: _buildVencimientoM(),
                      ),
                      Expanded(
                        child: _buildVencimientoY(),
                      )
                    ]),
                    _buildCV(),
                    /*CreditCard(//titular: _numeroTarjeta,
                    //vencimiento: _vencimiento
                    ),*/
                    SizedBox(height: 100),
                    RaisedButton(
                      child: Text(
                        'Pagar ahora',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        } else {
                          _formKey.currentState.save();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CardPyScreen(
                                  numeroT: _numeroTarjeta,
                                  vencM: _vencimiento_month,
                                  vencY: _vencimiento_year,
                                );
                              },
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

import 'package:diz/payment_screens/card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CardScreen(),
      )
  );
}

class CardScreen extends StatefulWidget{
  @override
  /*State<StatefulWidget> createState(){
    return CardScreenState();
  }*/
  CardScreenState createState() => CardScreenState();
}

class CardScreenState extends State<CardScreen>{

  String _titular;
  String _numeroTarjeta;
  String _vencimiento;
  String _cv;

  //final GlobalKey<_PayScreenState> _formKey = GlobalKey<_PayScreenState>();
  final GlobalKey<FormState> _formKey = GlobalKey <FormState>();

  Widget _buildNombre(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Titular de la tarjeta'),
      maxLength: 50,
      validator: (String value){
        if(value.isEmpty){
          return 'Dato requerido';
        }
        return null;
      } ,
      onSaved: (String value){
        _titular= value;
      },
    );
  }

  Widget _buildNumero(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Numero tarjeta'),
      maxLength: 16,
      keyboardType: TextInputType.phone,
      validator: (String value){
        if(value.isEmpty){
          return 'Dato requerido';
        }
        if(value.length <16){
          return 'Numero invalido';
        }
        return null;
      } ,
      onSaved: (String value){
        _numeroTarjeta= value;
      },
    );
  }

  Widget _buildVencimiento(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Fecha vencimiento (MM/YY)'),
      maxLength: 5,
      keyboardType: TextInputType.phone,
      validator: (String value){
        if(value.isEmpty){
          return 'Dato requerido';
        }
        return null;
      } ,
      onSaved: (String value){
        _vencimiento= value;
      },
    );
  }

  Widget _buildCV(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'CV'),
      maxLength: 3,
      keyboardType: TextInputType.phone,
      validator: (String value){
        if(value.isEmpty){
          return 'Dato requerido';
        }
        if(value.length <3){
          return 'CV invalido';
        }
        return null;
      } ,
      onSaved: (String value){
        _cv= value;
      },
    );
  }

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
                child: new Text('Datos de pago', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
            Container(
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildNombre(),
                    _buildNumero(),
                    _buildVencimiento(),
                    _buildCV(),
                    /*CreditCard(//titular: _numeroTarjeta,
                    //vencimiento: _vencimiento
                    ),*/
                    SizedBox(height: 100),
                    RaisedButton(
                      child: Text(
                        'Pagar ahora',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                      onPressed: () {
                        if(!_formKey.currentState.validate()){
                          return;
                        }
                        else{
                          _formKey.currentState.save();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CardPyScreen(numeroT: _numeroTarjeta, venc: _vencimiento);
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
        )
    );
  }
}
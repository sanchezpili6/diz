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

  String _name;
  String _numT;
  String _cv;
  String _street;
  String _numCasa;
  String _colonia;
  String _ciudad;
  String _cp;
  String _estado;
  String _calles;

  //final GlobalKey<_PayScreenState> _formKey = GlobalKey<_PayScreenState>();
  final GlobalKey<FormState> _formKey = GlobalKey <FormState>();

  Widget _buildNumberT(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Número de tarjeta'),
      maxLength: 16,
      keyboardType: TextInputType.phone,
      validator: (String value){
        if(value.isEmpty){
          return 'Dato requerido';
        }
        return null;
      } ,
      onSaved: (String value){
        _numT= value;
      },
    );
  }

  Widget _buildCV(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'CV: '),
      maxLength: 3,
      keyboardType: TextInputType.phone,
      validator: (String value){
        if(value.isEmpty){
          return 'Dato requerido';
        }
        return null;
      } ,
      onSaved: (String value){
        _numT= value;
      },
    );
  }

  Widget _buildName(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nombre titular tarjeta'),
      maxLength: 50,
      validator: (String value){
        if(value.isEmpty){
          return 'Dato requerido';
        }
        return null;
      } ,
      onSaved: (String value){
        _name= value;
      },
    );
  }

  Widget _buildStreet(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Dirreción: Calle'),
      maxLength: 50,
      validator: (String value){
        if(value.isEmpty){
          return 'Dirección requerida';
        }
        return null;
      } ,
      onSaved: (String value){
        _street= value;
      },
    );
  }

  Widget _buildNumC(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Dirreción: No. de casa'),
      maxLength: 50,
      validator: (String value){
        if(value.isEmpty){
          return 'Dirección requerida';
        }
        return null;
      } ,
      onSaved: (String value){
        _numCasa= value;
      },
    );
  }

  Widget _buildColonia(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Dirreción: Colonia'),
      maxLength: 50,
      validator: (String value){
        if(value.isEmpty){
          return 'Dirección requerida';
        }
        return null;
      } ,
      onSaved: (String value){
        _colonia= value;
      },
    );
  }

  Widget _buildCiudad(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Dirreción: Ciudad'),
      maxLength: 50,
      validator: (String value){
        if(value.isEmpty){
          return 'Dirección requerida';
        }
        return null;
      } ,
      onSaved: (String value){
        _ciudad= value;
      },
    );
  }

  Widget _buildCP(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Dirreción: Código postal'),
      maxLength: 50,
      keyboardType: TextInputType.phone,
      validator: (String value){
        if(value.isEmpty){
          return 'Dirección requerida';
        }
        return null;
      } ,
      onSaved: (String value){
        _cp= value;
      },
    );
  }

  Widget _buildEstado(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Dirreción: Estado'),
      maxLength: 50,
      validator: (String value){
        if(value.isEmpty){
          return 'Dirección requerida';
        }
        return null;
      } ,
      onSaved: (String value){
        _estado= value;
      },
    );
  }

  Widget _buildCalles(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Dirreción: Calles contiguas'),
      maxLength: 50,
      validator: (String value){
        if(value.isEmpty){
          return 'Dirección requerida';
        }
        return null;
      } ,
      onSaved: (String value){
        _calles= value;
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
                    _buildName(),
                    _buildNumberT(),
                    _buildCV(),
                    _buildStreet(),
                    _buildNumC(),
                    _buildColonia(),
                    _buildCiudad(),
                    _buildCP(),
                    _buildEstado(),
                    _buildCalles(),
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
                        _formKey.currentState.save();
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
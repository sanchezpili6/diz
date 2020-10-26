import 'package:flutter/material.dart';
import 'package:diz_app/tarjetas.dart';

void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FormScreen(),
      )
  );
}

class FormScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen>{

  String _name;
  String _lastname;
  String _birthday;
  String _mail;
  String _number;
  String _gender;
  String _adress;
  DateTime _dateTime;

  //final GlobalKey<_PayScreenState> _formKey = GlobalKey<_PayScreenState>();
  final GlobalKey<FormState> _formKey = GlobalKey <FormState>();

  Widget _buildName(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nombre'),
      maxLength: 20,
      validator: (String value){
        if(value.isEmpty){
          return 'Nombre requerido';
        }
      } ,
      onSaved: (String value){
        _name= value;
      },
    );
  }

  Widget _buildLastName(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Apellidos: '),
      maxLength: 20,
      validator: (String value){
        if(value.isEmpty){
          return 'Apellido requerido';
        }
      } ,
      onSaved: (String value){
        _lastname= value;
      },
    );
  }

  Widget _buildBirthday(){
    /*return RaisedButton(
      child: Text('Fecha'),
      onPressed: (){
        showDatePicker(context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2020)
        ).then((date){
          setState(() {
            _dateTime= date;
          });
        });
      },
    );*/
    return TextFormField(
      decoration: InputDecoration(labelText: 'Fecha Nacimiento'),

      validator: (String value){
        if(value.isEmpty){
          return 'Dato requerido';
        }
      } ,
      onSaved: (String value){
        _birthday = value;
      },
    );
  }

  Widget _buildMail(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Correo'),
      maxLength: 20,
      validator: (String value){
        if(value.isEmpty){
          return 'Correo requerido';
        }
        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
          return 'Correo invalido';
        }
      } ,
      onSaved: (String value){
        _mail = value;
      },
    );
  }

  Widget _buildNumber(){
    return TextFormField(
      decoration: InputDecoration(labelText: 'Numero telefonico'),
      keyboardType: TextInputType.phone,
      validator: (String value){
        if(value.isEmpty){
          return 'Dato requerido';
        }
      } ,
      onSaved: (String value){
        _number= value;
      },
    );
  }

  Widget _buildGender(){
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Género'),
      value: _gender,
      items: [
        DropdownMenuItem(
          child: Text("Masculino"),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text("Femenino"),
          value: 2,
        ),
        DropdownMenuItem(
          child: Text("Otro"),
          value: 3,
        ),
      ],
      onChanged: (value) {
        setState(() {
          _gender = value;
        });
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
                child: new Text('Pago productos', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),

            Container(
              margin: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildName(),
                    _buildLastName(),
                    _buildGender(),
                    _buildBirthday(),
                    _buildMail(),
                    _buildNumber(),
                    SizedBox(height: 100),
                    RaisedButton(
                      child: Text(
                        'Siguiente',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                      onPressed: () {
                        if(!_formKey.currentState.validate()){
                          return;
                        }
                        else{
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CardScreen();
                              },
                            ),
                          );
                        }
                        //_formKey.currentState.save();
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
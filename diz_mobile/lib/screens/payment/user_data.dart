import 'package:diz/constants.dart';
import 'package:diz/screens/payment/delivery.dart';
import 'package:diz/widgets/hamburguesita/navDrawerMenuPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../cart_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FormScreen(),
  ));
}

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;
  String _lastname;
  DateTime _birthday;
  String _mail;
  String _number;
  String _gender;

  //final GlobalKey<_PayScreenState> _formKey = GlobalKey<_PayScreenState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController dateCtl = TextEditingController();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nombre'),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Nombre requerido';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Apellidos: '),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Apellido requerido';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        _lastname = value;
      },
    );
  }

  Widget _buildBirthday() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Dato requerido';
        } else {
          return null;
        }
      },
      controller: dateCtl,
      decoration: InputDecoration(labelText: "Fecha de nacimiento"),
      onTap: () async {
        _birthday = DateTime(1900);
        FocusScope.of(context).requestFocus(new FocusNode());

        _birthday = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1970),
            lastDate: DateTime(2022));

        dateCtl.text = DateFormat('yyyy-MM-dd').format(_birthday);
      },
    );
  }

  Widget _buildMail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Correo'),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Correo requerido';
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          // ignore: missing_return, missing_return
          return 'Correo invalido';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        _mail = value;
      },
    );
  }

  Widget _buildNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Numero telefonico'),
      keyboardType: TextInputType.phone,
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Dato requerido';
        }
        if (value.length < 10) {
          return "Numero invalido";
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        _number = value;
      },
    );
  }

  Widget _buildGender() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Género'),
      value: _gender,
      onChanged: (_genderSelected) => setState(() => _gender = _genderSelected),
      validator: (value) => value == null ? 'Dato requerido' : null,
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
      /*onChanged: (value) {
          setState(() {
            _gender = value;
          });
        },*/
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
                child: new Text('Datos de compra',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
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
                                return EntregaScreen();
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
        ));
  }
}

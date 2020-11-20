import 'package:diz/widgets/formulario/birthday.dart';
import 'package:diz/widgets/formulario/mail.dart';
import 'package:diz/widgets/formulario/name.dart';
import 'package:diz/screens/payment/delivery.dart';
import 'package:diz/widgets/formulario/phoneNumber.dart';
import 'package:diz/widgets/hamburguesita/navDrawerMenuPrincipal.dart';
import 'package:flutter/material.dart';
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
  Widget _buildGender() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Género'),
      value: _gender,
      onChanged: (_genderSelected) => setState(() => _gender = _genderSelected),
      validator: (value) => value == null ? 'Dato requerido' : null,
      items: [
        DropdownMenuItem(
          child: Text("H"),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text("M"),
          value: 2,
        ),
        DropdownMenuItem(
          child: Text("O"),
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
                    buildName(_name, 'Nombre'),
                    buildName(_lastname, 'Apellido Paterno'),
                    buildName(_lastname, 'Apellido Materno'),
                    _buildGender(),
                    buildBirthday(dateCtl, _birthday, context),
                    buildMail(_mail),
                    buildNumber(_number),
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

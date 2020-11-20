import 'package:diz/widgets/formulario/mail.dart';
import 'package:flutter/material.dart';
import 'package:diz/widgets/formulario/contraseña.dart';
import 'package:diz/services/updatePass.dart';
import 'package:diz/widgets/formulario/token.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RecContrase(),
  ));
}

class RecContrase extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecContraseState();
  }
}

class RecContraseState extends State<RecContrase> {
  String _mail;
  String _contrasena;
  String _token;
  String _uid;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController dateCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black87,
            elevation: 0,
            actions: <Widget>[
            ]),
        body: new ListView(
          children: <Widget>[
            new Padding(
                padding: const EdgeInsets.all(15.0),
                child: new Text('Establecer nueva contraseña',
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
                    buildMail(_mail),
                    buildCont(_contrasena),
                    buildToken(_token),
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
                                return null;
                              },
                            ),
                          );
                        }
                        //_formKey.currentState.save();
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

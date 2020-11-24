import 'package:diz/screens/cart_screen.dart';
import 'package:diz/screens/payment/card_data.dart';
import 'package:diz/user_model.dart';
import 'package:diz/widgets/hamburguesita/navDrawerMenuPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:diz/services/registro.dart';
import 'package:diz/services/update_model.dart';
import 'package:diz/screens/home/main_page.dart';
import 'package:diz/services/patchUpdateUser.dart';

class CardInfoScreen extends StatefulWidget {
  @override
  _CardInfoScreenState createState() => _CardInfoScreenState();
}

class _CardInfoScreenState extends State<CardInfoScreen> {
  String _titular;
  String _numeroTarjeta;
  String _vencimiento_month;
  String _vencimiento_year;
  String _cv;

  UserModel _user;
  bool valid;

  //final GlobalKey<_PayScreenState> _formKey = GlobalKey<_PayScreenState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController numController = TextEditingController();
  final TextEditingController mesController = TextEditingController();
  final TextEditingController anioController = TextEditingController();

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
      controller: numController,
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
      controller: mesController,
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
      controller: anioController,
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
                    _buildNumero(),
                    Row(children: <Widget>[
                      Expanded(
                        child: _buildVencimientoM(),
                      ),
                      Expanded(
                        child: _buildVencimientoY(),
                      )
                    ]),
                    SizedBox(height: 100),
                    valid == false ? Text('Tarjeta invalida') : Container(),
                    SizedBox(height: 50),
                    RaisedButton(
                      child: Text(
                        'Actualizar',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onPressed: () async {
                        if (!_formKey.currentState.validate()) {
                          return;
                        } else {
                          _formKey.currentState.save();
                          final String noTarjeta = numController.text;
                          final String mesTarjeta = mesController.text;
                          final String anioTarjeta = anioController.text;

                          final UserModel user = await validarTarjeta(
                              noTarjeta, mesTarjeta, anioTarjeta);

                          setState(() {
                            _user = user;
                          });
                          if (_user != null) {
                            print("Tarjeta valida");
                             nTarjeta=numController.text;mTarjeta=mesController.text;aTarjeta=anioController.text;
                             print(nTarjeta);print(mTarjeta);print(aTarjeta);
                             UpdateUserModel user = UpdateUserModel(cliente: Cliente(fechaNac: cumple, apellidoMat: apellidoM, apellidoPat: apellidoP, genero: genero, nombrePila: nombrePila),clienteInfo: ClienteInfo(telefono: telefono, correo: correo, noTarjeta: nTarjeta, mesTarjeta: mTarjeta, anioTarjeta: aTarjeta, calle: calle,  colonia: colonia, ciudad: ciudad, cp: cp, estado: estado,entreCalles: entreCalles,),);
                             print(updateUserModelToJson(user));
                             var updateUser = await makePatchRequest(updateUserModelToJson(user));
                             if(updateUser==202){
                               print('success');
                               showDialog(
                                   context: context,
                                   builder: (buildcontext) {
                                     return AlertDialog(
                                       title: Text("ACTUALIZADO CON ÉXITO"),
                                       //content: Text("Regrese a la página principal"),
                                       actions: <Widget>[
                                         RaisedButton(
                                           child: Text(
                                             "Regresar a página principal",
                                             style: TextStyle(color: Colors.black),
                                           ),
                                           onPressed: () {
                                             Navigator.push(
                                               context,
                                               MaterialPageRoute(
                                                 builder: (context) {
                                                   return MainPage();
                                                 },
                                               ),
                                             );
                                           },
                                         )
                                       ],
                                     );
                                   }
                                 );
                             }
                             else{
                               showDialog(
                                   context: context,
                                   builder: (buildcontext) {
                                     return AlertDialog(
                                       title: Text("ERROR"),
                                       content: Text("No se pudo actualizar correctamente, inténtelo nuevamente"),
                                       actions: <Widget>[
                                         RaisedButton(
                                           child: Text(
                                             "CERRAR",
                                             style: TextStyle(color: Colors.white),
                                           ),
                                           onPressed: () {
                                             Navigator.of(context).pop();
                                           },
                                         )
                                       ],
                                     );
                                   });
                             }
                          } else {
                            print("Tarjeta invalida");
                            showDialog(
                                context: context,
                                builder: (buildcontext) {
                                  return AlertDialog(
                                    title: Text("ERROR"),
                                    content: Text("Tarjeta invalida"),
                                    actions: <Widget>[
                                      RaisedButton(
                                        child: Text(
                                          "CERRAR",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  );
                                });
                          }
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

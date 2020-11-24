import 'package:diz/screens/cart_screen.dart';
import 'package:diz/screens/home/main_page.dart';
import 'package:diz/screens/myAccount/infoScreen.dart';
import 'package:diz/services/deleteUserAccount.dart';
import 'package:diz/services/registro.dart';
import 'package:diz/widgets/hamburguesita/navDrawerMenuPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:diz/widgets/containerWidgetAccountScreen.dart';

class MyAccountScreen extends StatefulWidget {
  final user;
  MyAccountScreen({this.user});
  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () =>
                Navigator.of(context).pushNamed(CartScreen.routeName),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  'MI CUENTA',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            //nombrePila, apellidoPat, apellidoMat, fechaNac, genero,
            // CLienteInfo:  telefono correo noTarjeta, mesTarjeta, anioTarjeta, calle, colonia, ciudad, cp estado, entreCalles,
            containerWidgetMyAccount(value:  'Nombre:  ' + widget.user['nombrePila']),
            containerWidgetMyAccount(value: 'Apellidos:  ' + widget.user['apellidoPat']+ ' '+  widget.user['apellidoMat']),
            containerWidgetMyAccount(value: 'Fecha de nacimiento:  ' + widget.user['fechaNac'].toString()),
            containerWidgetMyAccount(value: 'Género:  ' + widget.user['genero']),
            containerWidgetMyAccount(value: 'Teléfono:  ' + widget.user['clienteInfo'][0]['telefono']),
            containerWidgetMyAccount(value: 'Correo:  ' + widget.user['clienteInfo'][0]['correo']),
            //containerWidgetMyAccount(value: 'NoTarjeta: ' + widget.user['clienteInfo'][0]['noTarjeta']==''?  widget.user['clienteInfo'][0]['noTarjeta']: '**** **** **** *'+ widget.user['clienteInfo'][0]['noTarjeta'].substring(14, 16)),
            containerWidgetMyAccount(value: 'NoTarjeta: ' + widget.user['clienteInfo'][0]['noTarjeta']),
            containerWidgetMyAccount(value: 'Calle: ' + widget.user['clienteInfo'][0]['calle']),
            containerWidgetMyAccount(value: 'Colonia: ' + widget.user['clienteInfo'][0]['colonia']),
            containerWidgetMyAccount(value: 'Ciudad: ' + widget.user['clienteInfo'][0]['ciudad']),
            containerWidgetMyAccount(value: 'CP: ' + widget.user['clienteInfo'][0]['cp']),
            containerWidgetMyAccount(value: 'Estado: ' + widget.user['clienteInfo'][0]['estado']),
            containerWidgetMyAccount(value: 'Entre Calles: ' + widget.user['clienteInfo'][0]['entreCalles']),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                color: Colors.blue,
                child: Text(
                  "ACTUALIZAR MI CUENTA",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InfoScreen()),);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                color: Colors.blue,
                child: Text(
                  "ELIMINAR MI CUENTA",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Eliminar Cuenta"),
                        content:
                            Text("Está seguro que desea eliminar su cuenta?"),
                        actions: [
                          FlatButton(
                            child: Text("Cancelar"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text("Continuar"),
                            onPressed: () async{
                              /*List<ClienteInfo> delete= [ClienteInfo(telefono: telefono, correo: correo, calle: calle,ciudad: ciudad,cp: cp, estado: estado, entreCalles: entreCalles, colonia: colonia, isMain: isMain)];
                              DeleteUser(id: int.parse(uid), apellidoPat: apellidoP, apellidoMat: apellidoM, nombrePila: nombrePila,genero: genero, fechaNac: cumple,isDeleted: isDeleted,clienteInfo: delete, compra: compra);*/
                             int success = await makeDeleteRequest(int.parse(uid));
                             if(success==301){
                               print(uid+' ID');
                               print('Status code '+success.toString());
                               logged=false;
                               //Navigator.of(context).pop();
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) {
                                     return MainPage();
                                   },
                                 ),
                               );
                             }
                             else{
                               print('Status code f: '+success.toString());
                               AlertDialog(
                                 title: Text("No se pudo eliminar"),
                                 content: Text("Inténtelo nuevamente"),
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
                             }
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
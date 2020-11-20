import 'package:diz/screens/cart_screen.dart';
import 'package:diz/screens/home/main_page.dart';
import 'package:diz/services/registro.dart';
import 'package:diz/widgets/hamburguesita/navDrawerMenuPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class MyAccountScreen extends StatefulWidget {
  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {


  makeDeleteRequest(uid) async {
    // post 1
    String url = 'http://35.239.19.77:8000/clients/$uid/';
    // make DELETE request
    Response response = await delete(url);
    // check the status code for the result
    int statusCode = response.statusCode;
    return statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        actions: <Widget>[
          /*IconButton(
            icon: Icon(Icons.search),
            onPressed: (){} ,
          ),*/
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
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB(50.0, 15.0, 30.0, 15.0),
                child: Text(
                  'Correo:  ' + correo,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
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

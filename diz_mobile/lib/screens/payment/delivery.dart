import 'package:diz/screens/payment/card_data.dart';
import 'package:diz/services/codezip.dart';
import 'package:diz/services/http_service.dart';
import 'package:diz/widgets/formulario/street.dart';
import 'package:diz/widgets/hamburguesita/navDrawerMenuPrincipal.dart';
import 'package:flutter/material.dart';
import '../cart_screen.dart';
import 'package:diz/services/registro.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EntregaScreen(),
  ));
}

class EntregaScreen extends StatefulWidget {
  @override
  EntregaScreenState createState() => EntregaScreenState();
}

class EntregaScreenState extends State<EntregaScreen> {
  Future<Album> futureAlbum;

  String _street;
  String _numCasa;
  String _colonia;
  String _ciudad;
  String _cp;
  String _estado;
  String _calles;
  final myController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final HttpService httpService = HttpService();

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  Widget _buildEstado() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Estado'),
      value: _estado,
      onChanged: (_estadoSelected) => setState(() {
        _estado = _estadoSelected;
        estado = _estado;
      }),
      validator: (value) => value == null ? 'Dato requerido' : null,
      items: [
        DropdownMenuItem(
          child: Text("Aguascalientes"),
          value: "agua",
        ),
        DropdownMenuItem(
          child: Text("Baja California"),
          value: "bajac",
        ),
        DropdownMenuItem(
          child: Text("Baja California Sur"),
          value: "bajacals",
        ),
        DropdownMenuItem(
          child: Text("Campeche"),
          value: "Campe",
        ),
        DropdownMenuItem(
          child: Text("Chiapas"),
          value: "Chia",
        ),
        DropdownMenuItem(
          child: Text("Chihuaha"),
          value: "Chih",
        ),
        DropdownMenuItem(
          child: Text("Ciudad de México"),
          value: "Cdmx",
        ),
        DropdownMenuItem(
          child: Text("Coahuila"),
          value: "Coa",
        ),
        DropdownMenuItem(
          child: Text("Colima"),
          value: "Col",
        ),
        DropdownMenuItem(
          child: Text("Durango"),
          value: "Dur",
        ),
        DropdownMenuItem(
          child: Text("Estado de México"),
          value: "EdoMex",
        ),
        DropdownMenuItem(
          child: Text("Guanajuato"),
          value: "Guan",
        ),
        DropdownMenuItem(
          child: Text("Guerrero"),
          value: "Gue",
        ),
        DropdownMenuItem(
          child: Text("Hidalgo"),
          value: "Hid",
        ),
        DropdownMenuItem(
          child: Text("Jalisco"),
          value: "Jalisco",
        ),
        DropdownMenuItem(
          child: Text("Michoacan"),
          value: "Micho",
        ),
        DropdownMenuItem(
          child: Text("Morelos"),
          value: "Mor",
        ),
        DropdownMenuItem(
          child: Text("Nayarit"),
          value: "Nay",
        ),
        DropdownMenuItem(
          child: Text("Nuevo León"),
          value: "NL",
        ),
        DropdownMenuItem(
          child: Text("Oaxaca"),
          value: "Oax",
        ),
        DropdownMenuItem(
          child: Text("Puebla"),
          value: "Pue",
        ),
        DropdownMenuItem(
          child: Text("Queretaro"),
          value: "Que",
        ),
        DropdownMenuItem(
          child: Text("Quintana Roo"),
          value: "Quintana",
        ),
        DropdownMenuItem(
          child: Text("San Luis"),
          value: "SL",
        ),
        DropdownMenuItem(
          child: Text("Sinaloa"),
          value: "Sin",
        ),
        DropdownMenuItem(
          child: Text("Son"),
          value: "Son",
        ),
        DropdownMenuItem(
          child: Text("Tabasco"),
          value: "Tab",
        ),
        DropdownMenuItem(
          child: Text("Tamaulipas"),
          value: "Tam",
        ),
        DropdownMenuItem(
          child: Text("Tlaxcala"),
          value: "Tlax",
        ),
        DropdownMenuItem(
          child: Text("Veracruz"),
          value: "Ver",
        ),
        DropdownMenuItem(
          child: Text("Yucatán"),
          value: "Yuc",
        ),
        DropdownMenuItem(
          child: Text("Zacatecas"),
          value: "Zaca",
        ),
      ],
      /*onChanged: (value) {
        setState(() {
          _estado = value;
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
        body:
            /*FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.codigo);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ));*/
            new ListView(
          children: <Widget>[
            new Padding(
                padding: const EdgeInsets.all(15.0),
                child: new Text('Dirección de entrega',
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
                    buildStreet(_cp, 'Código Postal', cp),
                    buildStreet(_street, 'Calle', calle),
                    buildStreet(_numCasa, 'No. de casa', ''),
                    buildStreet(_calles, 'Calles contiguas', entreCalles),
                    buildStreet(_colonia, 'Colonia', colonia),
                    buildStreet(_ciudad, 'Ciudad', ciudad),
                    _buildEstado(),
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
                                return CardScreen();
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

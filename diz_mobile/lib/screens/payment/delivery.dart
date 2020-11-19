import 'package:diz/screens/payment/card_data.dart';
import 'package:diz/widgets/formulario/street.dart';
import 'package:diz/widgets/hamburguesita/navDrawerMenuPrincipal.dart';
import 'package:flutter/material.dart';
import '../cart_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EntregaScreen(),
  ));
}

class EntregaScreen extends StatefulWidget {
  @override
  /*State<StatefulWidget> createState(){
    return CardScreenState();
  }*/
  EntregaScreenState createState() => EntregaScreenState();
}

class EntregaScreenState extends State<EntregaScreen> {
  String _street;
  String _numCasa;
  String _colonia;
  String _ciudad;
  String _cp;
  String _estado;
  String _calles;
  final myController = TextEditingController();
  //final GlobalKey<_PayScreenState> _formKey = GlobalKey<_PayScreenState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }
  _printLatestValue() {
    print("${myController.text}");
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  Widget _buildEstado() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Estado'),
      value: _estado,
      onChanged: (_estadoSelected) => setState(() => _estado = _estadoSelected),
      validator: (value) => value == null ? 'Dato requerido' : null,
      items: [
        DropdownMenuItem(
          child: Text("Aguascalientes"),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text("Baja California"),
          value: 2,
        ),
        DropdownMenuItem(
          child: Text("Baja California Sur"),
          value: 3,
        ),
        DropdownMenuItem(
          child: Text("Campeche"),
          value: 4,
        ),
        DropdownMenuItem(
          child: Text("Chiapas"),
          value: 5,
        ),
        DropdownMenuItem(
          child: Text("Chihuaha"),
          value: 6,
        ),
        DropdownMenuItem(
          child: Text("Ciudad de México"),
          value: 7,
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
        body: new ListView(
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
                    buildStreet(_cp, 'Código Postal'),
                    buildStreet(_street, 'Calle'),
                    buildStreet(_numCasa, 'No. de casa'),
                    buildStreet(_calles, 'Calles contiguas'),
                    buildStreet(_colonia, 'Colonia'),
                    buildStreet(_ciudad, 'Ciudad'),
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

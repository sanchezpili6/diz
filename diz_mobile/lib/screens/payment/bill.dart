import 'package:diz/services/bill_model.dart';
import 'package:diz/widgets/formulario/mail.dart';
import 'package:diz/widgets/formulario/name.dart';
import 'package:diz/screens/payment/delivery.dart';
import 'package:diz/widgets/formulario/number.dart';
import 'package:diz/widgets/formulario/phoneNumber.dart';
import 'package:diz/widgets/formulario/street.dart';
import 'package:diz/widgets/hamburguesita/navDrawerMenuPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../cart_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BillScreen(),
  ));
}

class BillScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BillScreenState();
  }
}

Future<BillModel> generarFactura(int compraId, String rfc, razonSocial, correo,
    telefono, calle, numero, colonia, ciudad, cp, estado, entreCalles) async {
  final String apiURL = 'http://35.239.19.77:8000/facturas/';

  final response = await http.post(apiURL, body: {
    "compraId": compraId,
    "rfc": rfc,
    "razonSocial": razonSocial,
    "correo": correo,
    "telefono": telefono,
    "calle": calle,
    "numero": numero,
    "colonia": colonia,
    "ciudad": ciudad,
    "cp": cp,
    "estado": estado,
    "entreCalles": entreCalles
  });

  if (response.statusCode == 201) {
    final String responseString = response.body;
    print("Status = " + response.statusCode.toString());
    return billModelFromJson(responseString);
  } else {
    print("Status = " + response.statusCode.toString());
    return null;
  }
}

class BillScreenState extends State<BillScreen> {
  int _compraid;
  String _RFC;
  String _razonsocial;
  String _correo;
  String _telefono;
  String _calle;
  String _numero;
  String _colonia;
  String _ciudad;
  String _cp;
  String _estado;
  String _calles;

  BillModel _bill;

  //final GlobalKey<_PayScreenState> _formKey = GlobalKey<_PayScreenState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController compraController = TextEditingController();
  final TextEditingController rfcController = TextEditingController();
  final TextEditingController razonController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController calleController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController coloniaController = TextEditingController();
  final TextEditingController ciudadController = TextEditingController();
  final TextEditingController cpController = TextEditingController();
  final TextEditingController entreCallesController = TextEditingController();

  Widget _buildNumberUnd(_number, _numberLabel, controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: _numberLabel),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Dato requerido';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        _number = int.parse(value);
      },
    );
  }

  Widget _buildName(_name, name, controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: name),
      maxLength: 20,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Dato Requerido';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        _name = value;
      },
    );
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
          child: Text("Ciudad de México"),
          value: 7,
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

  Widget _buildMail(_mail, controller) {
    return TextFormField(
      controller: controller,
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

  Widget _buildNumber(_number, controller) {
    return TextFormField(
      controller: controller,
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

  Widget _buildStreet(_street, label, controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      maxLength: 50,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Dirección requerida';
        }
        return null;
      },
      onSaved: (String value) {
        _street = value;
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
                    //_buildNumberUnd(
                    //   _compraid, "ID de compra", compraController),
                    //_buildNumberUnd(_RFC, "RFC", rfcController),
                    //_buildName(_razonsocial, 'Razón social', razonController),
                    //_buildMail(_correo, correoController),
                    //_buildNumber(_numero, telefonoController),
                    //_buildStreet(_calle, "Calle", calleController),
                    //_buildStreet(_numero, "Numero casa", numeroController),
                    //_buildStreet(_colonia, "Colonia", coloniaController),
                    //_buildStreet(_ciudad, "Ciudad", ciudadController),
                    //_buildStreet(_cp, "Codigo postal", cpController),
                    //_buildEstado(),
                    //_buildStreet(
                    //_calles, "Entre calles", entreCallesController),
                    SizedBox(height: 100),
                    RaisedButton(
                      child: Text(
                        'Generar factura',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onPressed: () async {
                        if (!_formKey.currentState.validate()) {
                          print("No guardado");
                          return;
                        } else {
                          print("Registrado");
                          _formKey.currentState.save();
                          final int compraId = int.parse(compraController.text);
                          final String rfc = rfcController.text;
                          final String razonSocial = razonController.text;
                          final String correo = correoController.text;
                          final String telefono = telefonoController.text;
                          final String calle = calleController.text;
                          final String numero = numeroController.text;
                          final String colonia = coloniaController.text;
                          final String ciudad = ciudadController.text;
                          final String cp = cpController.text;
                          final String estado = _estado;
                          final String entreCalles = entreCallesController.text;

                          final BillModel bill = await generarFactura(
                              12,
                              "AEDF000120610",
                              "Tec de Monterrey",
                              "facevesd@gmail.com",
                              "7223542312",
                              "Benito Juarez",
                              "23",
                              "La Joya",
                              "Zinacantepec",
                              "51355",
                              "Estado de México",
                              "23 de Febrero y 3 de Marzo");

                          setState(() {
                            _bill = bill;
                          });
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return EntregaScreen();
                              },
                            ),
                          );*/
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

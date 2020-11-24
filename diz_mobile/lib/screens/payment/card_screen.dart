import 'dart:convert';

import 'package:diz/models/cart.dart';
import 'package:diz/screens/payment/bill.dart';
import 'package:diz/screens/payment/credit_card.dart';
import 'package:diz/services/bill_model.dart';
import 'package:diz/services/compra_service.dart';
import 'package:diz/services/registro.dart';
import 'package:diz/widgets/cart_item.dart';
import 'package:diz/widgets/hamburguesita/navDrawerMenuPrincipal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../cart_screen.dart';

Future<BillModel> generarFactura(
    int compraId,
    String rfc,
    String razonSocial,
    String correo,
    String telefono,
    String calle,
    String numero,
    String colonia,
    String ciudad,
    String cp,
    String estado,
    String entreCalles) async {
  final String apiURL = 'http://35.239.19.77:8000/facturas/';

  final response = await http.post(apiURL,
      body: json.encode({
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
      }));

  if (response.statusCode == 201) {
    final String responseString = response.body;
    print("Status = " + response.statusCode.toString());
    return billModelFromJson(responseString);
  } else {
    print("Status = " + response.statusCode.toString());
    return null;
  }
}

Future<PurchaseModel> registrarCompra(
    int compraId,
    String noTarjeta,
    String mesTarjeta,
    String anioTarjeta,
    String total,
    String calle,
    String numero,
    String colonia,
    String ciudad,
    String cp,
    String estado,
    String entreCalles,
    String codigoProducto,
    String cantidadProducto,
    String precioProducto) async {
  final String apiURL = 'http://35.239.19.77:8000/compras/';

  final response = await http.post(apiURL,
      body: json.encode({
        "compraId": compraId,
        "noTarjeta": noTarjeta,
        "mesTarjeta": mesTarjeta,
        "anioTarjeta": anioTarjeta,
        "total": total,
        "calle": calle,
        "numero": numero,
        "colonia": colonia,
        "ciudad": ciudad,
        "cp": cp,
        "estado": estado,
        "entreCalles": entreCalles
      }));

  if (response.statusCode == 201) {
    final String responseString = response.body;
    print("Status = " + response.statusCode.toString());
    return purchaseModelFromJson(responseString);
  } else {
    print("Status = " + response.statusCode.toString());
    return null;
  }
}

class CardPyScreen extends StatelessWidget {
  final numeroT;
  final vencM;
  final vencY;

  BillModel _bill;
  PurchaseModel _purchase;

  CardPyScreen({this.numeroT, this.vencM, this.vencY});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
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
      body: Column(children: <Widget>[
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  new Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: new Text('¿Son correctos tus datos?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20))),
                ],
              ),
              Row(
                children: [
                  new Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CreditCard(
                          numeroTarjeta: numeroT,
                          vencimientoM: vencM,
                          vencimientoY: vencY))
                ],
              ),
              Row(
                children: [
                  new Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: new Text(
                          'Total productos: ' + cart.items.length.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20))),
                ],
              ),
            ],
          ),
        )),
        Expanded(
          child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartPdt(
                  cart.items.values.toList()[i].id,
                  cart.items.keys.toList()[i],
                  cart.items.values.toList()[i].price,
                  cart.items.values.toList()[i].cantidad,
                  cart.items.values.toList()[i].name)),
        ),
        Expanded(
          child: Column(
            children: [
              Row(children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text(
                      "Confimar compra",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      //PurchaseModel purchase = PurchaseModel(id: uid,  );
                      final PurchaseModel purchase = await registrarCompra(
                        33,
                        "4152313638174545",
                        "10",
                        "21",
                        "1200",
                        "Benito Juarez",
                        "23",
                        "La Joya",
                        "Zinacantepec",
                        "51355",
                        "Estado de México",
                        "23 de Febrero y 3 de Marzo",
                        "BCDE12",
                        "1",
                        "1200",
                      );

                      setState() {
                        _purchase = purchase;
                      }

                      print("Purchase:" + _bill.toString());
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return BillScreen();
                          },
                        ),
                      );*/
                    },
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    child: Text(
                      "Generar factura",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
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

                      setState() {
                        _bill = bill;
                      }

                      print("Bill:" + _bill.toString());
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return BillScreen();
                          },
                        ),
                      );*/
                    },
                  ),
                )
              ])
            ],
          ),
        ),
      ]),
    );
  }
}

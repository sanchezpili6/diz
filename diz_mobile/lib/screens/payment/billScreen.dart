import 'package:diz/screens/home/main_page.dart';
import 'package:diz/services/bill_model.dart';
import 'package:diz/services/registro.dart';
import 'package:diz/widgets/background.dart';
import 'package:diz/widgets/commonFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class BillScreen extends StatefulWidget {
  @override
  _BillScreenState createState() => _BillScreenState();
}
class _BillScreenState extends State<BillScreen> {
  String rfc = '', razonS = '';
  //rfc razon social correo telefono, calle, numero, colonia ciudad, cp , estado ,entre calles
  onChangedRfc(String value) {
    rfc = value;
    print(rfc);
  }
  onChangedRazonSocial(String value) {
    razonS = value;
    print(razonS);
  }

  makePostRequestBill(json) async {
    // set up POST request arguments
    String url = 'http://35.239.19.77:8000/facturas/';
    Map<String, String> headers = {"Content-type": "application/json"};
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    print(statusCode);
    print(response.body);
    // this API passes back the id of the new item added to the body
    return statusCode;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: ListView(
        children: <Widget>[
          Background(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.02),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: commonFieldWidget(
                    hintText: 'RFC',
                    onChanged: onChangedRfc,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: commonFieldWidget(
                    hintText: 'RAZON SOCIAL',
                    onChanged: onChangedRazonSocial,
                  ),
                ),
                //REGISTRO
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      color: Colors.blue,
                      onPressed: () async{
                        BillModel bill = BillModel(compraId: noPedido, rfc: rfc, razonSocial: razonS, estado: estado, ciudad: ciudad, colonia: colonia, correo: correo, numero: noCasa, cp: cp, entreCalles: entreCalles, calle: calle, telefono: telefono);
                        int value=await makePostRequestBill(billModelToJson(bill));
                        if(value==201){
                          showDialog(
                              context: context,
                              builder: (buildcontext) {
                                return AlertDialog(
                                  title: Text("FACTURA CREADA"),
                                  //content: Text("Favor de llenar todos los campos"),
                                  actions: <Widget>[
                                    RaisedButton(
                                      child: Text(
                                        "REGRESAR A PÁGINA PRINCIPAL",
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
                              });
                        }
                        else{
                          return AlertDialog(
                            title: Text("LO SENTIMOS"),
                            content: Text("No se pudo crear su factura"),
                            actions: <Widget>[
                              RaisedButton(
                                child: Text(
                                  "CERRAR",
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
                      },
                      child: Text(
                        "CREAR FACTURA",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

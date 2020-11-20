import 'package:diz/screens/signup/body2.dart';
import 'package:diz/services/registro.dart';
import 'package:diz/widgets/commonFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:diz/widgets/background.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime _birthday;
  String mail;
  TextEditingController mailController = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  String nombre = '', apellidoPaterno = '', apellidoMaterno = '';
  onChangedName(String name) {
    nombre = name;
    print(nombre);
  }

  onChangedApellidoPaterno(String name) {
    apellidoPaterno = name;
    print(apellidoPaterno);
  }

  onChangedApellidoMaterno(String name) {
    apellidoMaterno = name;
    print(apellidoMaterno);
  }
  Widget buildMail() {
    return TextFormField(
      controller: mailController,
      decoration: InputDecoration(labelText: 'Correo'),
      maxLength: 30,
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
          //return  mail=mailController.text;
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Background(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.02),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: buildMail(),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: commonFieldWidget(
                    hintText: 'NOMBRE',
                    onChanged: onChangedName,
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
                    hintText: 'APELLIDO PATERNO',
                    onChanged: onChangedApellidoPaterno,
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
                    hintText: 'APELLIDO MATERNO',
                    onChanged: onChangedApellidoMaterno,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Dato requerido';
                      } else {
                        return null;
                      }
                    },
                    controller: dateCtl,
                    decoration:
                        InputDecoration(labelText: "Fecha de nacimiento"),
                    onTap: () async {
                      _birthday = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      _birthday = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1970),
                          lastDate: DateTime(2022));

                      dateCtl.text = DateFormat('yyyy-MM-dd').format(_birthday);
                    },
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
                      onPressed: () {
                        print(mailController.text);print(nombre);print(apellidoPaterno); print(apellidoMaterno);
                        //SI ESTÁN VACIOS NO SE GUARDA
                        if(mailController.text==''||nombre==''||apellidoPaterno==''||apellidoMaterno==''){
                            showDialog(
                              context: context,
                              builder: (buildcontext) {
                                return AlertDialog(
                                  title: Text("Falta llenar un campo"),
                                  content: Text("Favor de llenar todos los campos"),
                                  actions: <Widget>[
                                    RaisedButton(
                                      child: Text("CERRAR", style: TextStyle(color: Colors.white),),
                                      onPressed: (){ Navigator.of(context).pop(); },
                                    )
                                  ],
                                );
                              }
                          );
                        }
                        else{
                          correo=mailController.text;
                          nombrePila=nombre;
                          apellidoP=apellidoPaterno;
                          apellidoM=apellidoMaterno;
                          try{
                            cumple=DateTime.parse(dateCtl.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Body2();
                                },
                              ),
                            );
                            }
                         catch(e){
                           showDialog(
                               context: context,
                               builder: (buildcontext) {
                                 return AlertDialog(
                                   content: Text("Por favor ingrese su fecha de nacimiento"),
                                   actions: <Widget>[
                                     RaisedButton(
                                       child: Text("CERRAR", style: TextStyle(color: Colors.white),),
                                       onPressed: (){ Navigator.of(context).pop(); },
                                     )
                                   ],
                                 );
                               }
                           );
                         }
                        }
                      },
                      child: Text(
                        "SIGUIENTE",
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

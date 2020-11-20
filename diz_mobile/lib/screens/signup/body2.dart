import 'package:diz/screens/home/main_page.dart';
import 'package:diz/services/RegisterUser.dart';
import 'package:diz/services/checksPassword.dart';
import 'package:diz/services/hashPassword.dart';
import 'package:diz/services/loginUser.dart';
import 'package:diz/services/registro.dart';
import 'package:diz/widgets/commonFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:diz/widgets/background.dart';

class Body2 extends StatefulWidget {
  @override
  _Body2State createState() => _Body2State();
}

class _Body2State extends State<Body2> {
  String _gender, password = '', phone = '', confirmedPassword;
  onChangedContrasena(String value) {
    password = value;
    print(password);
  }

  onChangedConfirmedContrasena(String value) {
    confirmedPassword = value;
    print(confirmedPassword);
  }

  onChangedPhone(String value) {
    phone = value;
    print(phone);
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
                  child: Expanded(
                      child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(labelText: 'Género'),
                          value: _gender,
                          onChanged: (_genderSelected) => setState(() {
                            _gender = _genderSelected;
                          }),
                          items: [
                            DropdownMenuItem(
                              child: Text("Masculino"),
                              value: 'H',
                            ),
                            DropdownMenuItem(
                              child: Text("Femenino"),
                              value: 'M',
                            ),
                            DropdownMenuItem(
                              child: Text("Otro"),
                              value: 'O',
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: commonFieldWidget(
                    hintText: 'TELÉFONO',
                    onChanged: onChangedPhone,
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: commonFieldWidgetPassword(
                      hintText: 'CONTRASEÑA', onChanged: onChangedContrasena),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: commonFieldWidgetPassword(
                    hintText: 'CONFIRMAR CONTRASEÑA',
                    onChanged: onChangedConfirmedContrasena,
                  ),
                ),
                //REGISTRO
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      color: Colors.blue,
                      child: Text(
                        "REGISTRARSE",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () async{
                        //SI ESTAN VACIOS
                        //print(_gender);print(phone);print(password);print(confirmedPassword);
                        if (confirmedPassword == '' || password == '' || _gender == '' || phone == '') {
                          showDialog(
                              context: context,
                              builder: (buildcontext) {
                                return AlertDialog(
                                  title: Text("Falta llenar un campo"),
                                  content:
                                      Text("Favor de llenar todos los campos"),
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
                        } else {
                          bool check=isPasswordCompliant(password);
                          if (check==true) {
                            if (confirmedPassword == password) {
                              //LAS CONTRASENAS COINCIDEN
                              telefono=phone;
                              genero=_gender;
                              //SE HASHEA EL PASSWORD
                              contrasena= await hashPaswordRequest(password);
                              print(contrasena);
                              RegisterUser user = RegisterUser(contrasena: contrasena, cliente:Cliente(nombrePila: nombrePila, apellidoMat: apellidoM, apellidoPat: apellidoP, genero: genero, fechaNac: cumple), clienteInfo:  ClienteInfo(correo: correo, telefono: phone));
                              print(registerUserToJson(user));
                              var newUser = await registerUser(registerUserToJson(user));
                              /*setState(() {
                                _user = newUser;
                              });*/
                              if (newUser != 201) {
                                print(newUser.toString()+' desde body');
                                //print("Registro fallido");
                                showDialog(
                                    context: context,
                                    builder: (buildcontext) {
                                      return AlertDialog(
                                        title: Text("Registro fallido"),
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
                                    });
                              }
                              else {
                                print(newUser.toString()+' desde Else');
                                logged=true;
                                await makePostRequest(correo, contrasena);
                                Navigator.push(context, MaterialPageRoute(builder: (context) {return MainPage();},),);
                              }
                            }
                            //ALERT LAS CONTRASENAS NO COINCIDEN
                            else {
                              showDialog(
                                  context: context,
                                  builder: (buildcontext) {
                                    return AlertDialog(
                                      content: Text(
                                          "Las contraseñas no coinciden, inténtelo de nuevo"),
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
                          //ALERT LA CONTRASENA NO CUMPLE CON SEGURIDAD
                          else {
                            showDialog(
                                context: context,
                                builder: (buildcontext) {
                                  return AlertDialog(
                                    content: Text(
                                        "La contraseña tiene que ser de 8 caracteres mínimo, 1 mayúscula, 1 minúscula, 1 caractér especial y 1 número"),
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

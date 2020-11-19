import 'package:diz/screens/home/main_page.dart';
import 'package:diz/widgets/commonFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:diz/widgets/background.dart';

class Body2 extends StatefulWidget {
  @override
  _Body2State createState() => _Body2State();
}

class _Body2State extends State<Body2> {

  String _gender;
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
                  child:  Expanded(
                      child: Row(
                        children: [
                          Expanded(flex: 4,child:
                      DropdownButtonFormField(
                        decoration: InputDecoration(labelText: 'Género'),
                        value: _gender,
                        onChanged: (_genderSelected) => setState(() => _gender = _genderSelected),
                        validator: (value) => value == null ? 'Dato requerido' : null,
                        items: [
                          DropdownMenuItem(
                            child: Text("Masculino"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Femenino"),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text("Otro"),
                            value: 3,
                          ),
                        ],
                        /*onChanged: (value) {
          setState(() {
            _gender = value;
          });
        },*/
                      ),),
                        ],
                      )
                  ),
                ),


                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child:commonFieldWidget(hintText: 'TELÉFONO',),
                ),


                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: commonFieldWidget(hintText: 'CONTRASEÑA',),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: commonFieldWidget(hintText: 'CONFIRMAR CONTRASEÑA',),
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
                      child: Text(
                        "REGISTRARSE",
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




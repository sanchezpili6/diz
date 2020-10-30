import 'package:diz/constants.dart';
import 'package:flutter/material.dart';
import 'background.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
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
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle, color: kPrimaryColor),
                    hintText: "NOMBRE",
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle, color: kPrimaryColor),
                    hintText: "APELLIDO PATERNO",
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle, color: kPrimaryColor),
                    hintText: "APELLIDO MATERNO",
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: InputDatePickerFormField(
                  fieldLabelText: 'FECHA DE NACIMIENTO',
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2002)
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle, color: kPrimaryColor),
                    hintText: "GÉNERO",
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle, color: kPrimaryColor),
                    hintText: "TELEFONO",
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle, color: kPrimaryColor),
                    hintText: "CONTRASEÑA",
                    hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
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
                    color: Colors.purpleAccent,
                    onPressed: () {},
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
    );
  }
}

import 'package:diz/constants.dart';
import 'package:flutter/material.dart';
import 'background.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "LOGIN",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          SvgPicture.asset(
            "assets/icons/login.svg",
            height: size.height * 0.42,
          ),
          SizedBox(height: size.height *0.03),
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
                icon: Icon(Icons.account_circle,
                color: kPrimaryColor),
                hintText: "TU CORREO",
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
                icon: Icon(Icons.lock,
                    color: kPrimaryColor),
                hintText: "CONTRASEÑA",
              ),

            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: Colors.purpleAccent,
                onPressed: (){},
                child: Text("LOGIN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontSize: 20,
                ),),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
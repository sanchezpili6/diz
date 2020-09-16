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
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
                "YOU WILL LOVE DIZ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                ),
            ),
          ),
          SvgPicture.asset(
            "assets/icons/chat.svg",
            height: size.height * 0.42,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: kPrimaryLightColor,
                onPressed: (){},
                child: Text("LOGIN"),
              ),
            ),
          ),
          Container(
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                color: Colors.purpleAccent[200],
                onPressed: (){},
                child: Text("SIGN UP"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
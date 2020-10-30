import 'package:diz/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'background.dart';
import 'package:diz/login/login_screen.dart';
import 'package:diz/widgets/rounded_button.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            SizedBox(height: size.height * 0.05),

            Image(
              height: size.height * 0.45,
              image: AssetImage(
              'assets/images/diz.png'
            ),
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              color: Colors.blue,
              text: "INICIAR SESIÓN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "REGÍSTRATE",
              color: Colors.white,
              textColor: Colors.blue,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

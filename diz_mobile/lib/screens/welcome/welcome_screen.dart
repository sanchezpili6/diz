import 'package:diz/screens/login/login_screen.dart';
import 'package:diz/screens/signup/signup_screen.dart';
import 'package:diz/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:diz/widgets/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
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
      ),
    );
  }
}



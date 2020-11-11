import 'package:diz/screens/home/main_page.dart';
import 'package:diz/widgets/background.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String mail='';
  String password='';
  onChangedMail(String newText){
    mail = newText;
    print(mail);
  }
  onChangedPassword(String newText){
    password = newText;
    print(password);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "    LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            /*SvgPicture.asset(
            "assets/icons/login.svg",
            height: size.height * 0.42,
          ),*/
            SizedBox(height: size.height *0.03),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                onChanged: onChangedMail,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle,
                      color: Colors.blue),
                  hintText: "   CORREO",
                ),

              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                onChanged: onChangedPassword,
                obscureText: true,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock,
                      color: Colors.blue),
                  hintText: "  CONTRASEÑA",
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
                  color: Colors.blue,
                  onPressed: (){
                    if(mail=='jacky@gmail.com' && password=='jacky')
                    {
                      print('entra');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MainPage();
                          },
                        ),
                      );
                    }
                    else{
                      showDialog(
                          context: context,
                          builder: (buildcontext) {
                            return AlertDialog(
                              title: Text("ERROR"),
                              content: Text("Usuario o contraseña incorrectos"),
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
                  },
                  child: Text("INICIAR SESIÓN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

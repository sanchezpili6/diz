import 'package:flutter/material.dart';
import 'package:diz/services/updatePass.dart';
import 'package:diz/widgets/background.dart';
import 'package:diz/screens/login/login_screen.dart';

class RecContrase extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecContraseState();
  }
}
class RecContraseState extends State<RecContrase> {
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
              "Elige una nueva contraseña",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
                fontSize: 25,
              ),
            ),
            /*SvgPicture.asset(
            "assets/icons/login.svg",
            height: size.height * 0.42,
          ),*/
            SizedBox(height: size.height *0.03),
            //CORREO
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
            //CONTRASENA
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
              padding: EdgeInsets.symmetric(vertical: 2 ),
              width: size.width * 0.4 ,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10  , horizontal: 4 ),
                  color: Colors.black54,
                  onPressed: ()async{
                    int valid= await makePostRequestUpdate(mail, password);
                    // if(mail=='jacky@gmail.com' && password=='jacky')
                        {
                      print('olvidó su contraseña');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    }
                  },
                  child: Text("SIGUIENTE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white ,
                      fontSize: 12  ,
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

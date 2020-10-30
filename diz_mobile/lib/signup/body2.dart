import 'package:diz/home/main_page.dart';
import 'package:flutter/material.dart';
import 'background.dart';

class Body2 extends StatelessWidget {
  String dropdownValue='F';
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
                  child:  Expanded(
                    child: Row(
                      children: [
                        Expanded(flex: 4,child: TextField(
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            icon: Icon(Icons.account_circle, color: Colors.blue),
                            hintText: dropdownValue,
                            hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ),),
                        Expanded(
                          flex: 1,
                          child: DropdownButton<String>(
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            style: TextStyle(color: Colors.deepPurple,),
                            onChanged: (String newValue) {
                              dropdownValue = newValue;
                            },
                            items: <String>['F', 'M']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
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
                  child: TextField(
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle, color: Colors.blue),
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
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: TextField(
                    obscureText: true,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle, color: Colors.blue),
                      hintText: "CONTRASEÑA",
                      hintStyle: TextStyle(fontSize: 13, color: Colors.grey,),
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
                    obscureText: true,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle, color: Colors.blue),
                      hintText: "CONFIRMAR CONTRASEÑA",
                      hintStyle: TextStyle(fontSize: 13, color: Colors.grey,),
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

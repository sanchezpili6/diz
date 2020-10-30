import 'package:diz/signup/body2.dart';
import 'package:flutter/material.dart';
import 'background.dart';

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
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle, color:Colors.blue),
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
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle, color:Colors.blue),
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
                  borderRadius: BorderRadius.circular(29),
                ),
                child: TextField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle, color:Colors.blue),
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
                  borderRadius: BorderRadius.circular(29),
                ),
                child: InputDatePickerFormField(
                  fieldLabelText: 'FECHA DE NACIMIENTO',
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2002)
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
                            return Body2();
                          },
                        ),
                      );


                    },
                    child: Text(
                      "SIGUIENTE",
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

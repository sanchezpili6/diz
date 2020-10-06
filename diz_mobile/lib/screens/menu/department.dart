import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Department extends StatelessWidget {
  final Text department;
  final Color colour;
  final Color bckColour;
  Department({@required this.department, this.colour, this.bckColour});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          department.data,
          style: TextStyle(color: colour),
        ),
        backgroundColor: bckColour,
      ),
      body: Center(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Text(
                          "Bienvenido(a) al departamento de " + department.data,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colour,
                            fontSize: 22.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

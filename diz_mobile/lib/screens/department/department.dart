import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Department extends StatefulWidget {

  final Text department;
  final Color colour;
  final Color bckColour;
  Department({@required this.department, this.colour, this.bckColour});
  @override
  _DepartmentState createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.department.data,
          style: TextStyle(color: widget.colour),
        ),
        backgroundColor: widget.bckColour,
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
                          "Bienvenido(a) al departamento de " + widget.department.data,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: widget.colour == Color(0xFFFFFFFF)? Colors.black: widget.colour,
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


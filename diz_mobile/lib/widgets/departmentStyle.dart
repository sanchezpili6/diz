import 'package:flutter/material.dart';
import 'package:diz/screens/department/department.dart';

class DepartmentWidget extends StatelessWidget {
  final Icon icon;
  final Text title;
  final Color color;
  final Color bckColor;

  DepartmentWidget({this.icon, this.title, this.color, this.bckColor});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: title,
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Department(department: title, colour: color,bckColour: bckColor,),
          ),
        ),
      },
    );
  }
}

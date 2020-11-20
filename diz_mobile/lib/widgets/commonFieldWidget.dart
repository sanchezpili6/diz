import 'package:flutter/material.dart';
class commonFieldWidget extends StatelessWidget {
  final String hintText;
  final Function onChanged;
  commonFieldWidget({this.hintText, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
      ),
    );
  }
}

class commonFieldWidgetPassword extends StatelessWidget {
  final String hintText;
  final Function onChanged;
  commonFieldWidgetPassword({this.hintText, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      onChanged: onChanged,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
      ),
    );
  }
}

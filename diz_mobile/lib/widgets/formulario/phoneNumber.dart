
import 'package:flutter/material.dart';

Widget buildNumber(_number) {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Numero telefonico'),
    keyboardType: TextInputType.phone,
    maxLength: 10,
    validator: (String value) {
      if (value.isEmpty) {
        return 'Dato requerido';
      }
      if (value.length < 10) {
        return "Numero invalido";
      } else {
        return null;
      }
    },
    onSaved: (String value) {
      _number = value;
    },
  );
}
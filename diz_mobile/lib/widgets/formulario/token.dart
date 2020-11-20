import 'package:flutter/material.dart';

Widget buildToken(_token) {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Token'),
    maxLength: 10,
    validator: (String value) {
      if (value.isEmpty) {
        return 'Token requerido';
      } else {
        return null;
      }
    },
    onSaved: (String value) {
      _token = value;
    },
  );
}
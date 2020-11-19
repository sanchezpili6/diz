import 'package:flutter/material.dart';

Widget buildName(_name, name) {
  return TextFormField(
    decoration: InputDecoration(labelText: name),
    maxLength: 20,
    validator: (String value) {
      if (value.isEmpty) {
        return 'Dato Requerido';
      } else {
        return null;
      }
    },
    onSaved: (String value) {
      _name = value;
    },
  );
}
import 'package:flutter/material.dart';

Widget buildStreet(_street, label) {
  return TextFormField(
    decoration: InputDecoration(labelText: label),
    maxLength: 50,
    validator: (String value) {
      if (value.isEmpty) {
        return 'Dirección requerida';
      }
      return null;
    },
    onSaved: (String value) {
      _street = value;
    },
  );
}
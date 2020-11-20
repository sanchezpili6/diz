import 'package:flutter/material.dart';

Widget buildCont(_contrasena) {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Contraseña'),
    maxLength: 10,
    validator: (String value) {
      if (value.isEmpty) {
        return 'Contraseña requerida';
      } else {
        return null;
      }
    },
    onSaved: (String value) {
      _contrasena = value;
    },
  );
}
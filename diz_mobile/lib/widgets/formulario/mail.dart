import 'package:flutter/material.dart';

Widget buildMail(_mail) {
  return TextFormField(
    decoration: InputDecoration(labelText: 'Correo'),
    maxLength: 20,
    validator: (String value) {
      if (value.isEmpty) {
        return 'Correo requerido';
      }
      if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        // ignore: missing_return, missing_return
        return 'Correo invalido';
      } else {
        return null;
      }
    },
    onSaved: (String value) {
      _mail = value;
    },
  );
}
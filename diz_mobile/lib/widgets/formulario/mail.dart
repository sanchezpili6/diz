import 'package:flutter/material.dart';
import 'package:diz/services/registro.dart';
Widget buildMail(_mail) {
  return TextFormField(
    initialValue: correo,
    decoration: InputDecoration(labelText: correo),
    maxLength: 30,
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
      print(_mail);
      correo=_mail;
    },
  );
}
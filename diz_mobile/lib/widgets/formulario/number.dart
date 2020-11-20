import 'package:flutter/material.dart';

Widget buildNumberUnd(_number, _numberLabel) {
  return TextFormField(
    decoration: InputDecoration(labelText: _numberLabel),
    keyboardType: TextInputType.phone,
    validator: (String value) {
      if (value.isEmpty) {
        return 'Dato requerido';
      } else {
        return null;
      }
    },
    onSaved: (String value) {
      _number = value;
    },
  );
}

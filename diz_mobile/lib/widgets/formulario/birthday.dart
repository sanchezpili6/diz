import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
Widget buildBirthday(dateCtl, _birthday, context) {
  return TextFormField(
    validator: (String value) {
      if (value.isEmpty) {
        return 'Dato requerido';
      } else {
        return null;
      }
    },
    controller: dateCtl,
    decoration: InputDecoration(labelText: "Fecha de nacimiento"),
    onTap: () async {
      _birthday = DateTime(1900);
      FocusScope.of(context).requestFocus(new FocusNode());

      _birthday = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1970),
          lastDate: DateTime(2022));

      dateCtl.text = DateFormat('yyyy-MM-dd').format(_birthday);
    },
  );
}
import 'package:flutter/material.dart';
import 'package:diz/services/registro.dart';
Widget buildStreet(_street, label, val) {
  return TextFormField(
    initialValue: val,
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
      if(label=='Calle'){
        calle=_street;
        print(calle+' calle');
      }else if(label=='Código Postal'){
        cp=_street;
        print(cp+' cp');
      }
      else if(label=='Calles contiguas'){
        entreCalles=_street;
        print(entreCalles+' calles C');
      }
      else if(label=='Colonia'){
        colonia=_street;
        print(colonia+' colonia');
      }
      else if(label=='Ciudad'){
        ciudad=_street;
        print(ciudad+' ciudad');
      }
    },
  );
}
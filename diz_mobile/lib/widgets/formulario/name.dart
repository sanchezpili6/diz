import 'package:flutter/material.dart';
import 'package:diz/services/registro.dart';
Widget buildName(_name, name) {
  var val='';
  if(name=='Nombre'){
    val=nombrePila;
  }else if(name=='Apellido Paterno'){
    val=apellidoP;
  }
  else if(name=='Apellido Materno'){
    val=apellidoM;
  }
  return TextFormField(
    initialValue: val,
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
      if(name=='Nombre'){
        nombrePila=_name;
      }else if(name=='Apellido Paterno'){
        apellidoP=_name;
      }
      else if(name=='Apellido Materno'){
        apellidoM=_name;
      }
    },
  );
}
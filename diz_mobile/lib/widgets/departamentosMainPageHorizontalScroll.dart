import 'package:flutter/material.dart';
class Departamentos extends StatefulWidget{
  @override
  _DepsState createState() => _DepsState();
}

class _DepsState extends State<Departamentos>{
  List<String> departamentos = ["Videojuegos", "Ropa", "Librería", "Blancos y Muebles", "Vinos y Licores"];
  int departamentoSeleccionado = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: departamentos.length,
        itemBuilder: (context, index) => buildDepartamento(index),
      ),
    );
  }

  Widget buildDepartamento(int index){
    return GestureDetector(
      onTap:(){
        setState(() {
          departamentoSeleccionado = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Text(
                departamentos[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: departamentoSeleccionado == index ? Colors.black54 : Colors.black26,
                )
            ),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              height: 2,
              width: 30,
              color: departamentoSeleccionado == index ? Colors.black : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}

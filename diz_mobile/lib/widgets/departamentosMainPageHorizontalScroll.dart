import 'package:flutter/material.dart';
import 'package:diz/widgets/allProducts.dart';

class Departamentos extends StatefulWidget{
  @override
  _DepsState createState() => _DepsState();
}

class _DepsState extends State<Departamentos>{
  List<String> departamentos = ["Ropa", "Libros", "Vinos y Licores", "Videojuegos", "Línea Blanca", "Muebles", "Electrónica"];
  int departamentoSeleccionado = 0;
  int cate = 0;
  @override
  Widget build(BuildContext context) {
    cate = departamentoSeleccionado +7    ;
    return Column(
      children: [
        SizedBox(
          height: 25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: departamentos.length,
            itemBuilder: (context, index) => buildDepartamento(index),
          ),
        ),
        SizedBox(
          //height: 50,
          child: buildProductos(cate),
        ),
      ],
    );
  }

  Widget buildDepartamento(int index){
    return GestureDetector(
      onTap:(){
        setState(() {
          departamentoSeleccionado = index;
          cate = departamentoSeleccionado +1;
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

  Widget buildProductos(int index){
    return GestureDetector(
      onTap:(){
        setState(() {
          departamentoSeleccionado = index;
          cate = index +1;
        });
      },
      child: Container(
        child: AllProducts(cat: cate),
      ),
    );
  }
}
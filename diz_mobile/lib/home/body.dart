import 'package:diz/Products/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:diz/Products/product.dart';
import 'package:diz/Products/body.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Text(
            "Artículos con descuento",
            style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Departamentos(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(product: products[index]),
            ),
          ),
        ),
      ],
    );
  }
}
class ItemCard extends StatelessWidget{
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(product.image),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                product.title,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Text(
              "\$${product.price}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        );
  }
}

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

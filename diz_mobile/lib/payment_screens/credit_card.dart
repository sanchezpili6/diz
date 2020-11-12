import 'dart:math';
import 'package:flutter/material.dart';


class CreditCard extends StatefulWidget{
  final titular;
  final numeroTarjeta;
  final vencimiento;
  final cv;

  CreditCard({
    this.titular,
    this.numeroTarjeta,
    this.vencimiento,
    this.cv
  });


  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard>{

  double horizontalDrag=0;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
        onHorizontalDragUpdate: (horizontal){
          setState(() {
            horizontalDrag += horizontal.delta.dx;
            horizontalDrag %= 360;
          });
        },
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.0001)
            ..rotateY(pi / 180 * horizontalDrag),
          alignment: Alignment.center,
          child: Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [Colors.black45, Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
            ),
            child: horizontalDrag <= 90 || horizontalDrag >= 270 ? cardFront(): cardBack(),
          ),
        )
    );
  }



  Widget cardFront(){
    return Container(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Tarjeta de credito',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
              Text('|', style: TextStyle(
                color: Colors.grey,
                letterSpacing: 10,
                fontSize: 10,
              ),
              ),
              Text(
                'Banco Universal',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10
                ),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Image.asset(
            'assets/chip.png',
            height: 25,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            //'1612 2345 5566 2312',
            widget.numeroTarjeta,
            style: TextStyle(
                color: Colors.grey[300],
                fontSize: 18,
                wordSpacing: 15,
                shadows: [
                  BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 2,
                    color: Colors.black,
                    offset: Offset(2,2),
                  )
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            //'12/22',
            widget.vencimiento,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget cardBack(){
    return Container(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.grey[700],
          )
        ],
      ),
    );
  }
}
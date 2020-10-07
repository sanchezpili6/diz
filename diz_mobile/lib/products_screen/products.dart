import 'package:diz_app/main.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list=[
    {
      "name": "Marvel: Avengers",
      "picture": "assets/game_avengers.jpg",
      "price": "1500",
    },
    {
      "name": "EA Sports: FIFA 21",
      "picture": "assets/fifa.jpg",
      "price": "1599",
    },
    {
      "name": "Harry Potter: The Game",
      "picture": "assets/harry_potter.jpg",
      "price": "1500",
    },
    {
      "name": "The Last of Us",
      "picture": "assets/last_of_us.jpg",
      "price": "1399",
    },
    {
      "name": "NBA 2K21",
      "picture": "assets/nba.jpg",
      "price": "1450",
    },
    {
      "name": "Spiderman: Miles Morales",
      "picture": "assets/spiderman.jpg",
      "price": "1599",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Single_prod(
            product_name: product_list[index]['name'],
            product_img: product_list[index]['picture'],
            product_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final product_name;
  final product_img;
  final product_price;

  Single_prod({
    this.product_name,
    this.product_img,
    this.product_price
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: product_name,
          child: Material(
            child: InkWell(onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(builder: (context)=> new ProductDetails(
                  product_detail_name: product_name,
                  product_detail_price: product_price,
                  product_detail_img: product_img,
                ))),
              child: GridTile(
                  footer: Container(
                      color: Colors.white70,
                      child: ListTile(
                        leading: Text(product_name, style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        //subtitle: Text("\$$product_price", style: TextStyle(
                        //  color: Colors.red, fontWeight: FontWeight.w800),),
                        //isThreeLine: true,
                      )
                  ),
                  child: Image.asset(product_img, fit: BoxFit.cover,)),
            ),
          )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:diz/Products/product.dart';

void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductDetails(),
      )
  );
}

/*class ProductDetails extends StatefulWidget{
  final product_detail_name;
  final product_detail_img;
  final product_detail_price;
  final Product product;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_img,
    this.product_detail_price,
    this.product
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}*/

class ProductDetails extends StatelessWidget{
  final Product product;
  const ProductDetails({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          title: Text('Diz'),
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: (){})
          ],
        ),

        drawer: new Drawer(
            child: new ListView(
                children: <Widget>[

                ]
            )
        ),

        body: new ListView(
          children: <Widget>[
            new Container(
                height: 300.0,
                child: GridTile(
                    child: Container(
                      child: Image.asset(product.image),
                    ),
                    footer: new Container(
                        color: Colors.blue,
                        margin: EdgeInsets.symmetric(horizontal:  50.0),
                        child: ListTile(
                            title: new Center(
                              child: Text(product.title, style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.white )),
                            )
                        )
                    )
                )
            ),

            Divider(),

            new ListTile(
              title: new Center(
                child: Text(product.price.toString(), style: TextStyle(
                    fontSize:25, fontWeight: FontWeight.bold, color: Colors.red),),
              ),
            ),

            new ListTile(
              title: new Center(
                child: Text("Descripción del producto", style: TextStyle(fontWeight: FontWeight.bold,)),
              ),
              subtitle: new Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at aliquet neque. Donec et lacus arcu. Nullam in ligula odio. Integer semper euismod fringilla. In at nulla felis. Integer eget mi eu erat sodales elementum. Phasellus posuere laoreet sem eget interdum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc convallis est lorem, eget laoreet nisl luctus tincidunt. Maecenas sagittis velit vel risus ultricies efficitur"),
            ),

            Divider(),

            Row(
              children: <Widget>[
                Expanded(
                    child: MaterialButton(
                        onPressed: (){},
                        color: Colors.red,
                        textColor: Colors.white,
                        elevation: 0.2,
                        child: new Text("Agregar al carrito", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))
                    )
                )
              ],
            ),

            Row(
              children: <Widget>[
                Expanded(
                    child: MaterialButton(
                        onPressed: (){},
                        color: Colors.red,
                        textColor: Colors.white,
                        elevation: 0.2,
                        child: new Text("Compra ahora", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))
                    )
                )
              ],
            )
          ],
        )
    );
  }
}
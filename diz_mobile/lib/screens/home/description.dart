import 'package:diz/widgets/hamburguesita/navDrawerMenuPrincipal.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductDetails(),
      )
  );
}

class ProductDetails extends StatefulWidget{
  final product_detail_name;
  final product_detail_img;
  final product_detail_price;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_img,
    this.product_detail_price
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.black87,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: (){},
            ),
          ],
        ),
        body:ListView(
          children: <Widget>[
             Container(
                height: 300.0,
                child: GridTile(
                    child: Container(
                      child: Image.asset(widget.product_detail_img),
                    ),
                    footer: new Container(
                        color: Colors.blue,
                        margin: EdgeInsets.symmetric(horizontal:  50.0),
                        child: ListTile(
                            title: new Center(
                              child: Text(widget.product_detail_name, style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.white )),
                            )
                        )
                    )
                )
            ),

            Divider(),

            new ListTile(
              title: new Center(
                child: Text(widget.product_detail_price, style: TextStyle(
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
import 'package:flutter/material.dart';

void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      )
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: Text('Diz'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed:(){}),
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed:(){})
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //header
            new UserAccountsDrawerHeader(
              accountName: Text('Karina Amador'),
              accountEmail: Text('akarina.at@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.blueGrey,
              ),
            ),
            //BODY

            InkWell(
              onTap: (){},
              child: ListTile(
                  title: Text('Inicio'),
                  leading: Icon(Icons.home)
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                  title: Text('Perfil'),
                  leading: Icon(Icons.person)
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                  title: Text('Mis pedidos'),
                  leading: Icon(Icons.shopping_basket)
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                  title: Text('Formas de pago'),
                  leading: Icon(Icons.credit_card)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

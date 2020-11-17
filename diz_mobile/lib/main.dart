
import 'package:diz/screens/home/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'package:diz/models/ordersK.dart';
import 'package:diz/models/productsK.dart';
import 'package:diz/screens/pdt_detail_screen.dart';
import './models/cart.dart';
import './screens/cart_screen.dart';



void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          ChangeNotifierProvider.value(
            value: Products(),
          ),
          ChangeNotifierProvider.value(
            value: Product(),
          ),
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          ChangeNotifierProvider.value(
            value: Orders(),
          )
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diz',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        //home:ProductScreen(),
        home: MainPage(),
        routes: {
          DetailPage.routeName: (ctx) => DetailPage(),
          CartScreen.routeName: (ctx) => CartScreen(),
        }
      ),
    );
  }
}
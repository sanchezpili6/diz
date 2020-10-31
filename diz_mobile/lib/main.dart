import 'package:diz/Products/details_screen.dart';
import 'package:diz/home/main_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diz',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      //home:ProductScreen(),
      home: MainPage(),
    );
  }
}
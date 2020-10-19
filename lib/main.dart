import 'package:flutter/material.dart';
import 'package:pizza_shop/home.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: "Gilroy"),
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

//well regular is not working that much lets have bold font
//lets check the heavy one also


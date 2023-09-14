import 'package:flutter/material.dart';
import 'package:template/home_page.dart';


void main() {
  runApp(const MyApp()); //main function = MyApp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), //kör homepage
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}

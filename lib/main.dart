import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/home_page.dart';
import 'package:template/todo_mystate.dart';

void main() {
  MyState state = MyState();
  state.fetchList();

  runApp(ChangeNotifierProvider(
      create: (context) => state, child: const MyApp() //main function = MyApp
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(), //kör homepage
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}

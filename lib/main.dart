import 'package:flutter/material.dart';
import 'package:lojavirtual/screens/home_screen.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clothing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color.fromARGB(255, 4, 125, 141),
        accentColor: Colors.black
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

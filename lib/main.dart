import 'package:flutter/material.dart';
import 'package:newpeter/bought.dart';
import 'package:newpeter/buy.dart';
import 'package:newpeter/items.dart';
import 'package:newpeter/login.dart';
import 'my_homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static bool isLoggedIn = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nature's Pride",
      theme: ThemeData(primarySwatch: Colors.blue),
      home:
          isLoggedIn ? const MyHomePage(title: "Nature's Pride") : LoginPage(),
      routes: {
        MyScreen2.routName: (BuildContext context) => MyScreen2(),
        MyBought.routName: (BuildContext context) => MyBought(),
      },
    );
  }
}

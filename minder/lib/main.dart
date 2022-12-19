import 'package:flutter/material.dart';
import 'package:minder/config/palette.dart';
import 'package:minder/views/homePage.dart';
import 'package:minder/views/loginPage.dart';
import 'views/loginsignup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

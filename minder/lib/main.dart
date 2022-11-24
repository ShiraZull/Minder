import 'package:flutter/material.dart';
import 'package:minder/config/palette.dart';
import 'package:minder/views/loginPage.dart';
import 'views/loginsignup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(
        backgroundColor: Palette.backgroundColor,
      ),
    );
  }
}

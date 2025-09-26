import 'package:flutter/material.dart';
import 'views/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق إدارة البيانات',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial',
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
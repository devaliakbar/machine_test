import 'package:flutter/material.dart';
import 'package:machine_test/pages/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Machine Test',
      theme: ThemeData(splashColor: Colors.transparent, fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

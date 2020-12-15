import 'package:flutter/material.dart';
import 'package:machine_test/widgets/normal_text.dart';

class Home extends StatelessWidget {
  static const String myRoute = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: NormalText("Ali"),
      ),
    );
  }
}

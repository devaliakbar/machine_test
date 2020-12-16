import 'package:flutter/material.dart';

class HomeLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

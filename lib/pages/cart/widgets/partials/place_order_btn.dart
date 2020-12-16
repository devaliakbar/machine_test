import 'package:flutter/material.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:machine_test/widgets/normal_text.dart';

class PlaceOrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: double.infinity,
      height: 60.0,
      child: RaisedButton(
        color: AppTheme.darkGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(23),
          ),
        ),
        child: NormalText(
          "Place Order",
          color: Colors.white,
          size: AppTheme.fontSizeXL,
        ),
        onPressed: () {},
      ),
    );
  }
}

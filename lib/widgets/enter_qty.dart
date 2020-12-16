import 'package:flutter/material.dart';
import 'package:machine_test/services/settings/app_theme.dart';

class EnterQty extends StatelessWidget {
  final Function increment;
  final Function decrement;
  final TextEditingController qtyController;
  final Color backgroundColor;
  EnterQty(this.qtyController,
      {this.increment, this.decrement, this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 50.0,
          height: 45.0,
          child: RaisedButton(
            color: backgroundColor == null
                ? AppTheme.primaryGreenColor
                : backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(23),
                topLeft: Radius.circular(23),
              ),
            ),
            elevation: 0,
            onPressed: () {
              int currentQty = int.parse(qtyController.text);
              if (currentQty != 0) {
                currentQty--;
                decrement();
              }
              qtyController.text = currentQty.toString();
            },
            child: Icon(Icons.horizontal_rule, color: Colors.white),
          ),
        ),
        Container(
          width: 58.0,
          height: 45,
          color: backgroundColor == null
              ? AppTheme.primaryGreenColor
              : backgroundColor,
          child: TextField(
            enabled: false,
            controller: qtyController,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: AppTheme.fontSizeL, color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: backgroundColor == null
                  ? AppTheme.primaryGreenColor
                  : backgroundColor,
            ),
          ),
        ),
        SizedBox(
          width: 50.0,
          height: 45.0,
          child: RaisedButton(
              color: backgroundColor == null
                  ? AppTheme.primaryGreenColor
                  : backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(23),
                  topRight: Radius.circular(23),
                ),
              ),
              elevation: 0,
              onPressed: () {
                int currentQty = int.parse(qtyController.text);
                if (currentQty != 100) {
                  currentQty++;
                  increment();
                }
                qtyController.text = currentQty.toString();
              },
              child: Icon(Icons.add, color: Colors.white)),
        ),
      ],
    );
  }
}

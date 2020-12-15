import 'package:flutter/material.dart';
import 'package:machine_test/services/settings/app_theme.dart';

class EnterQty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _qtyController = TextEditingController();
    _qtyController.text = "5";
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 60.0,
          height: 45.0,
          child: RaisedButton(
            color: AppTheme.primaryGreenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(23),
                topLeft: Radius.circular(23),
              ),
            ),
            elevation: 0,
            onPressed: () {
              int currentQty = int.parse(_qtyController.text);
              if (currentQty != 0) {
                currentQty--;
              }
              _qtyController.text = currentQty.toString();
            },
            child: Icon(Icons.horizontal_rule, color: Colors.white),
          ),
        ),
        Container(
          width: 68.0,
          height: 45,
          color: AppTheme.primaryGreenColor,
          child: TextField(
            enabled: false,
            controller: _qtyController,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: AppTheme.fontSizeL, color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppTheme.primaryGreenColor,
            ),
          ),
        ),
        SizedBox(
          width: 60.0,
          height: 45.0,
          child: RaisedButton(
              color: AppTheme.primaryGreenColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(23),
                  topRight: Radius.circular(23),
                ),
              ),
              elevation: 0,
              onPressed: () {
                int currentQty = int.parse(_qtyController.text);
                if (currentQty != 100) {
                  currentQty++;
                }
                _qtyController.text = currentQty.toString();
              },
              child: Icon(Icons.add, color: Colors.white)),
        ),
      ],
    );
  }
}

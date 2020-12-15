import 'package:flutter/material.dart';

smsEnterDialogue({BuildContext context, Function verifyOTP}) {
  TextEditingController _textFieldController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Enter The OTP'),
        content: TextField(
          controller: _textFieldController,
          textInputAction: TextInputAction.go,
          keyboardType: TextInputType.numberWithOptions(),
          decoration: InputDecoration(hintText: "OTP"),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Submit'),
            onPressed: () {
              Navigator.of(context).pop();
              verifyOTP(_textFieldController.text.trim());
            },
          )
        ],
      );
    },
  );
}

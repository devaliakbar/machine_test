import 'package:flutter/material.dart';

phoneEnterDialogue({BuildContext context, Function verifyNumber}) {
  TextEditingController _textFieldController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Enter The Phone Number'),
        content: TextField(
          controller: _textFieldController,
          textInputAction: TextInputAction.go,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(hintText: "Phone"),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Submit'),
            onPressed: () {
              Navigator.of(context).pop();
              verifyNumber(_textFieldController.text.trim());
            },
          )
        ],
      );
    },
  );
}

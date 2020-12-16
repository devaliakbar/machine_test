import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/pages/cart/bloc/cart_bloc.dart';
import 'package:machine_test/pages/home/home.dart';
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
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Success'),
                content: const Text('Order successfully placed'),
                actions: [
                  FlatButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();

                      BlocProvider.of<CartBloc>(context).add(ResetCartEvent());

                      Navigator.of(context).pushNamedAndRemoveUntil(
                          Home.myRoute, (Route<dynamic> route) => false);
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

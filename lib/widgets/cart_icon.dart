import 'package:flutter/material.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:machine_test/widgets/normal_text.dart';

class CartIcon extends StatelessWidget {
  final int cartCount;
  final Function onPress;
  CartIcon({this.cartCount = 0, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: AppTheme.secondaryGreyColor,
            size: AppTheme.iconSizeM,
          ),
          onPressed: onPress,
        ),
        Positioned(
          right: 3,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(11),
              ),
            ),
            height: 22,
            width: 22,
            child: Center(
              child: NormalText(
                cartCount.toString(),
                color: Colors.white,
                size: AppTheme.fontSizeS,
              ),
            ),
          ),
        )
      ],
    );
  }
}

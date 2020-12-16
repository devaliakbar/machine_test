import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/pages/cart/bloc/cart_bloc.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:machine_test/widgets/cart_icon.dart';

class BuildHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  BuildHomeAppBar({this.appBar});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: AppTheme.primaryGreyColor),
      actions: [
        BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {
            print("Cart Changed");
          },
          builder: (_, state) {
            if (state is CartInitial) {
              return CartIcon(
                cartCount: state.cartModel.noOfItems,
              );
            }
            return CartIcon(
              cartCount: 0,
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

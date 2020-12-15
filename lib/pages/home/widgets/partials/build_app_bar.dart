import 'package:flutter/material.dart';
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
        CartIcon(
          cartCount: 0,
        )
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

import 'package:flutter/material.dart';
import 'package:machine_test/services/settings/app_theme.dart';

import 'package:machine_test/widgets/normal_text.dart';

class BuildCartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  BuildCartAppBar({this.appBar});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: AppTheme.secondaryGreyColor),
      title: NormalText(
        "Order Summary",
        size: AppTheme.fontSizeL,
        boldText: true,
        color: AppTheme.secondaryGreyColor,
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

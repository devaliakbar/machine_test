import 'package:flutter/material.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:machine_test/utils/util.dart';
import 'package:machine_test/widgets/normal_text.dart';

class BuildTotalAmount extends StatelessWidget {
  final double totalAmount;
  BuildTotalAmount(this.totalAmount);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NormalText(
            "Total Amount",
            size: AppTheme.fontSizeL,
            boldText: true,
            color: Colors.black,
          ),
          NormalText(
            Util.formatCurrency(totalAmount),
            size: AppTheme.fontSizeL,
            boldText: true,
            color: AppTheme.primaryGreenColor,
          )
        ],
      ),
    );
  }
}

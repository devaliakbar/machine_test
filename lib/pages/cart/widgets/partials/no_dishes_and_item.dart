import 'package:flutter/material.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:machine_test/widgets/normal_text.dart';

class NoOfDishesAndItemWidget extends StatelessWidget {
  final int noDishes;
  final int noItems;

  NoOfDishesAndItemWidget({@required this.noDishes, @required this.noItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppTheme.darkGreen,
      ),
      width: double.infinity,
      height: 55,
      child: Center(
        child: NormalText(
          '$noDishes Dishes - $noItems Items',
          color: Colors.white,
          boldText: true,
          size: AppTheme.fontSizeL,
        ),
      ),
    );
  }
}

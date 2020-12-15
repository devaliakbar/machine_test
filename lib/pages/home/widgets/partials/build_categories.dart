import 'package:flutter/material.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:machine_test/widgets/normal_text.dart';

class BuildCategories extends StatelessWidget {
  final List<String> categories;
  final int currentIndex;

  BuildCategories(this.categories, this.currentIndex);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: currentIndex == index ? AppTheme.pinkColor : Colors.white,
          child: Container(
            alignment: Alignment.center,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.only(
              bottom: 2,
            ),
            child: NormalText(
              categories[index],
              boldText: true,
              color: currentIndex == index
                  ? AppTheme.pinkColor
                  : AppTheme.secondaryGreyColor,
            ),
          ),
        );
      },
    );
  }
}

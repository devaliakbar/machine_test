import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/pages/home/bloc/data/home_model.dart';
import 'package:machine_test/pages/home/bloc/home_bloc.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:machine_test/widgets/normal_text.dart';

class BuildCategories extends StatelessWidget {
  final List<HomeCategory> categories;
  final int currentIndex;

  BuildCategories(this.categories, this.currentIndex);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            BlocProvider.of<HomeBloc>(context)
                .add(HomeCategoryChangeEvent(newIndex: index));
          },
          child: Container(
            color: currentIndex == index ? AppTheme.pinkColor : Colors.white,
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.only(
                bottom: 2,
              ),
              child: NormalText(
                categories[index].categoryName,
                boldText: true,
                color: currentIndex == index
                    ? AppTheme.pinkColor
                    : AppTheme.secondaryGreyColor,
              ),
            ),
          ),
        );
      },
    );
  }
}

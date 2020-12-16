import 'package:flutter/material.dart';
import 'package:machine_test/pages/home/bloc/data/home_model.dart';
import 'package:machine_test/pages/home/widgets/partials/build_categories.dart';
import 'package:machine_test/pages/home/widgets/partials/build_dishes.dart';

class HomeBody extends StatelessWidget {
  final HomeModel homeData;
  HomeBody(this.homeData);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: BuildCategories(
            homeData.homecategories,
            homeData.selectedIndex,
          ),
        ),
        Expanded(
            child: BuildDishes(
                homeData.homecategories[homeData.selectedIndex].homeDishes))
      ],
    );
  }
}

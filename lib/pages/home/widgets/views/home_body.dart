import 'package:flutter/material.dart';
import 'package:machine_test/pages/home/bloc/data/home_model.dart';
import 'package:machine_test/pages/home/widgets/partials/build_dishes.dart';

class HomeBody extends StatelessWidget {
  final HomeModel homeData;
  HomeBody(this.homeData);
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: List.generate(
        homeData.homecategories.length,
        (index) {
          return Tab(
            child: BuildDishes(homeData.homecategories[index].homeDishes),
          );
        },
      ),
    );
  }
}

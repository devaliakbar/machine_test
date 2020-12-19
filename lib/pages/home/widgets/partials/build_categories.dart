import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/pages/home/bloc/home_bloc.dart';
import 'package:machine_test/services/settings/app_theme.dart';

class BuildCategories extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
      print("Home State Changed");
    }, builder: (context, state) {
      return TabBar(
        isScrollable: true,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.pink,
        labelColor: Colors.pink,
        tabs: List.generate(
          state is HomeLoadedState ? state.homeData.homecategories.length : 0,
          (index) {
            return Tab(
              child: Text(
                state is HomeLoadedState
                    ? state.homeData.homecategories[index].categoryName
                    : "",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: AppTheme.fontSizeM),
              ),
            );
          },
        ),
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(30.0);
}

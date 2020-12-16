import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/pages/home/bloc/home_bloc.dart';
import 'package:machine_test/pages/home/widgets/partials/build_app_bar.dart';
import 'package:machine_test/pages/home/widgets/partials/build_drawer.dart';
import 'package:machine_test/pages/home/widgets/views/home_body.dart';
import 'package:machine_test/pages/home/widgets/views/home_error.dart';
import 'package:machine_test/pages/home/widgets/views/home_loading.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(HomeLoadEvent());

    return Scaffold(
      drawer: BuildDrawer(),
      appBar: BuildHomeAppBar(
        appBar: AppBar(),
      ),
      body: SafeArea(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            print("Home State Changed");
          },
          builder: (context, state) {
            if (state is HomeLoadFailedState) {
              return HomeError(state.errorMsg);
            } else if (state is HomeLoadedState) {
              return HomeBody(state.homeData);
            } else {
              return HomeLoading();
            }
          },
        ),
      ),
    );
  }
}

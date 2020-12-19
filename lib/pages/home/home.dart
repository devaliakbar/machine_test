import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/pages/cart/cart.dart';
import 'package:machine_test/pages/home/bloc/home_bloc.dart';
import 'package:machine_test/pages/home/widgets/partials/build_app_bar.dart';
import 'package:machine_test/pages/home/widgets/partials/build_drawer.dart';
import 'package:machine_test/pages/home/widgets/views/home_body.dart';
import 'package:machine_test/pages/home/widgets/views/home_error.dart';
import 'package:machine_test/pages/home/widgets/views/home_loading.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:machine_test/services/settings/status_bar_color.dart';

class Home extends StatefulWidget {
  static const String myRoute = '/home';
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    StatusBarColor.setUpStatusbarColor(
        backgroundColor: AppTheme.primaryGreenColor, whiteColor: true);

    BlocProvider.of<HomeBloc>(context).add(HomeLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        print("Home State Changed");
      },
      builder: (context, state) {
        return DefaultTabController(
          length: state is HomeLoadedState
              ? state.homeData.homecategories.length
              : 0,
          child: Scaffold(
            drawer: BuildDrawer(),
            appBar: BuildHomeAppBar(
              appBar: AppBar(),
              cartBtnPressed: () async {
                await Navigator.pushNamed(context, Cart.myRoute);
                if (mounted) setState(() {});
              },
            ),
            body: SafeArea(
              child: state is HomeLoadFailedState
                  ? HomeError(state.errorMsg)
                  : (state is HomeLoadedState)
                      ? HomeBody(state.homeData)
                      : HomeLoading(),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:machine_test/pages/home/widgets/partials/build_app_bar.dart';
import 'package:machine_test/pages/home/widgets/partials/build_categories.dart';
import 'package:machine_test/pages/home/widgets/partials/build_dishes.dart';
import 'package:machine_test/pages/home/widgets/partials/build_drawer.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BuildDrawer(),
      appBar: BuildHomeAppBar(
        appBar: AppBar(),
      ),
      body: SafeArea(
        child: Column(
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
                [
                  "Ali Akbar",
                  "Rabka Ila",
                  "Ali Akbar",
                  "Rabka Ila",
                  "Ali Akbar",
                  "Rabka Ila",
                ],
                2,
              ),
            ),
            Expanded(child: BuildDishes())
          ],
        ),
      ),
    );
  }
}

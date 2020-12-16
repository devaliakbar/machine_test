import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:machine_test/pages/cart/bloc/cart_bloc.dart';
import 'package:machine_test/pages/cart/widgets/partials/build_app_bar.dart';
import 'package:machine_test/pages/cart/widgets/partials/build_cart_item.dart';
import 'package:machine_test/pages/cart/widgets/partials/build_total.dart';
import 'package:machine_test/pages/cart/widgets/partials/no_dishes_and_item.dart';
import 'package:machine_test/pages/cart/widgets/partials/place_order_btn.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildCartAppBar(
        appBar: new AppBar(),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          print("Cart Changed");
        },
        builder: (_, state) {
          if (state is CartInitial) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                NoOfDishesAndItemWidget(
                                  noDishes: state.cartModel.noOfDishes,
                                  noItems: state.cartModel.noOfItems,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                BuildCartItems(state.cartModel.cartDishes),
                                BuildTotalAmount(state.cartModel.totalAmount),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    state.cartModel.cartDishes.length > 0
                        ? PlaceOrderButton()
                        : Container()
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/pages/cart/bloc/cart_bloc.dart';
import 'package:machine_test/pages/cart/bloc/data/cart_model.dart';
import 'package:machine_test/pages/cart/bloc/data/cart_repo.dart';
import 'package:machine_test/pages/home/bloc/data/home_model.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:machine_test/widgets/enter_qty.dart';
import 'package:machine_test/widgets/image_from_network.dart';
import 'package:machine_test/widgets/normal_text.dart';

class BuildDishes extends StatelessWidget {
  final List<HomeDishes> homeDishes;
  BuildDishes(this.homeDishes);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: AppTheme.secondaryGreyColor,
        ),
        itemCount: homeDishes.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildDish(context, index),
      ),
    );
  }

  Widget _buildDish(BuildContext context, int index) {
    TextEditingController qtyController = TextEditingController();
    qtyController.text = "0";

    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        print("Cart Changed");
      },
      builder: (_, state) {
        if (state is CartInitial) {
          state.cartModel.cartDishes.forEach((v) {
            if (v.dishId == homeDishes[index].dishId) {
              qtyController.text = "${v.qty}";
            }
          });

          return Container(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.radio_button_checked,
                            color: homeDishes[index].isVeg
                                ? AppTheme.primaryGreenColor
                                : Colors.red,
                            size: AppTheme.iconSizeM,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: NormalText(
                              homeDishes[index].dishName,
                              size: AppTheme.fontSizeL,
                              boldText: true,
                              color: AppTheme.primaryGreyColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 31, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NormalText(
                              "INR " + homeDishes[index].price.toString(),
                              boldText: true,
                              color: AppTheme.primaryGreyColor,
                            ),
                            NormalText(
                              homeDishes[index].calories.round().toString() +
                                  ' Calories',
                              boldText: true,
                              color: AppTheme.primaryGreyColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 31, right: 15),
                        child: NormalText(
                          homeDishes[index].dishDescription,
                          color: AppTheme.secondaryGreyColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 31),
                        child: EnterQty(
                          qtyController,
                          increment: () {
                            BlocProvider.of<CartBloc>(context).add(
                                AddToCartEvent(
                                    cartDishes: new CartDishes(
                                        homeDishes[index].dishId,
                                        homeDishes[index].dishName,
                                        homeDishes[index].isVeg,
                                        homeDishes[index].calories,
                                        homeDishes[index].price,
                                        1,
                                        homeDishes[index].price),
                                    opCode: CartRepo.ACTION_INCREMENT));
                          },
                          decrement: () {
                            BlocProvider.of<CartBloc>(context).add(
                                AddToCartEvent(
                                    cartDishes: new CartDishes(
                                        homeDishes[index].dishId,
                                        homeDishes[index].dishName,
                                        homeDishes[index].isVeg,
                                        homeDishes[index].calories,
                                        homeDishes[index].price,
                                        1,
                                        homeDishes[index].price),
                                    opCode: CartRepo.ACTION_DECREMENT));
                          },
                        ),
                      ),
                      SizedBox(
                        height: homeDishes[index].isCustomizable ? 12 : 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 35),
                        child: homeDishes[index].isCustomizable
                            ? NormalText(
                                "Customizible",
                                color: Colors.red,
                              )
                            : Container(),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 75,
                  child: ImageFromNetwork(
                    homeDishes[index].imageUrl,
                  ),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

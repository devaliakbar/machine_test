import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/pages/cart/bloc/cart_bloc.dart';
import 'package:machine_test/pages/cart/bloc/data/cart_model.dart';
import 'package:machine_test/pages/cart/bloc/data/cart_repo.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:machine_test/utils/util.dart';
import 'package:machine_test/widgets/enter_qty.dart';
import 'package:machine_test/widgets/normal_text.dart';

class BuildCartItems extends StatelessWidget {
  final List<CartDishes> cartDishes;
  BuildCartItems(this.cartDishes);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        cartDishes.length,
        (index) => _buildCartItem(context, index),
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, int index) {
    TextEditingController qtyController = TextEditingController();
    qtyController.text = "${cartDishes[index].qty}";
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.radio_button_checked,
                        color: cartDishes[index].isVeg
                            ? AppTheme.primaryGreenColor
                            : Colors.red,
                        size: AppTheme.iconSizeM,
                      ),
                      Expanded(
                        child: NormalText(
                          cartDishes[index].dishName,
                          size: AppTheme.fontSizeL,
                          boldText: true,
                          color: AppTheme.primaryGreyColor,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 27, top: 20),
                    child: NormalText(
                      Util.formatCurrency(cartDishes[index].price),
                      size: AppTheme.fontSizeL,
                      boldText: true,
                      color: AppTheme.primaryGreyColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 27, top: 10),
                    child: NormalText(
                      "${cartDishes[index].calories} calories",
                      boldText: true,
                      color: AppTheme.primaryGreyColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 7,
            ),
            EnterQty(
              qtyController,
              increment: () {
                BlocProvider.of<CartBloc>(context).add(
                  AddToCartEvent(
                      cartDishes: cartDishes[index],
                      opCode: CartRepo.ACTION_INCREMENT),
                );
              },
              decrement: () {
                BlocProvider.of<CartBloc>(context).add(
                  AddToCartEvent(
                      cartDishes: cartDishes[index],
                      opCode: CartRepo.ACTION_DECREMENT),
                );
              },
              backgroundColor: AppTheme.darkGreen,
            ),
            SizedBox(
              width: 7,
            ),
            NormalText(
              Util.formatCurrency(cartDishes[index].total),
              boldText: true,
              size: AppTheme.fontSizeL,
              color: AppTheme.primaryGreyColor,
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          color: AppTheme.secondaryGreyColor,
        )
      ],
    );
  }
}

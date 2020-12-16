import 'package:machine_test/pages/cart/bloc/data/cart_model.dart';

class CartRepo {
  static const String ACTION_INCREMENT = "INCREMENT";
  static const String ACTION_DECREMENT = "DECREMENT";

  final CartModel cartModel = new CartModel();

  void addItemToCart(CartDishes cartDishes, String opCode) {
    for (int i = 0; i < cartModel.cartDishes.length; i++) {
      CartDishes tempDish = cartModel.cartDishes[i];

      if (tempDish.dishId == cartDishes.dishId) {
        if (opCode == ACTION_DECREMENT) {
          int qty = tempDish.qty - 1;
          if (qty < 1) {
            cartModel.cartDishes.removeAt(i);
            cartModel.noOfDishes -= 1;
            cartModel.noOfItems -= 1;
            cartModel.totalAmount -= tempDish.price;
            return;
          }
          cartModel.cartDishes[i].qty = qty;
          cartModel.cartDishes[i].total = qty * tempDish.price;
          cartModel.noOfItems -= 1;
          cartModel.totalAmount -= tempDish.price;
          return;
        } else {
          cartModel.cartDishes[i].qty += 1;
          cartModel.cartDishes[i].total = tempDish.qty * tempDish.price;
          cartModel.noOfItems += 1;
          cartModel.totalAmount += tempDish.price;
          return;
        }
      }
    }

    cartModel.cartDishes.add(cartDishes);

    cartModel.noOfDishes += 1;
    cartModel.noOfItems += 1;
    cartModel.totalAmount += cartDishes.price;
  }

  void resetCart() {
    cartModel.cartDishes = new List<CartDishes>();
    cartModel.noOfDishes = 0;
    cartModel.noOfItems = 0;
    cartModel.totalAmount = 0;
  }
}

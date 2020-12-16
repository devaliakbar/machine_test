class CartModel {
  int noOfDishes = 0;
  int noOfItems = 0;
  double totalAmount = 0;

  List<CartDishes> cartDishes = new List<CartDishes>();
}

class CartDishes {
  final String dishId;
  final String dishName;
  final bool isVeg;
  final double calories;
  final double price;
  int qty;
  double total;

  CartDishes(this.dishId, this.dishName, this.isVeg, this.calories, this.price,
      this.qty, this.total);
}

part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends CartEvent {
  final CartDishes cartDishes;
  final String opCode;
  AddToCartEvent({@required this.cartDishes, @required this.opCode});

  @override
  List<Object> get props => [cartDishes, opCode];
}

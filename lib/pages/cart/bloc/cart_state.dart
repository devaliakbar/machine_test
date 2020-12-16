part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {
  final CartModel cartModel;
  CartInitial({@required this.cartModel});

  @override
  List<Object> get props => [cartModel];
}

class CartLoading extends CartState {}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/pages/cart/bloc/data/cart_model.dart';
import 'package:machine_test/pages/cart/bloc/data/cart_repo.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo _cartRepo;
  CartBloc(this._cartRepo) : super(CartInitial(cartModel: _cartRepo.cartModel));

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is AddToCartEvent) {
      yield CartLoading();
      _cartRepo.addItemToCart(event.cartDishes, event.opCode);
      yield CartInitial(cartModel: _cartRepo.cartModel);
    }
  }
}

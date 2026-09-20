import 'package:flutter/foundation.dart';

@immutable
abstract class CartState {
  const CartState();
}

class CartInitial extends CartState {
  const CartInitial();
}

class CartLoading extends CartState {
  const CartLoading();
}

class CartUpdated extends CartState {
  final List<Map<String, dynamic>> items;
  final double totalPrice;

  const CartUpdated({required this.items, required this.totalPrice});
}

class CartError extends CartState {
  final String message;

  const CartError(this.message);
}

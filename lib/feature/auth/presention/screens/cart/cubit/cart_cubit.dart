import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final List<Map<String, dynamic>> _cartItems = [];

  CartCubit() : super(const CartInitial());

  List<Map<String, dynamic>> get items => List.unmodifiable(_cartItems);

  void addToCart(Map<String, dynamic> product) {
    final index = _cartItems.indexWhere(
      (item) =>
          item['id'] == product['id'] &&
          item['size'] == product['size'] &&
          item['color'] == product['color'],
    );

    if (index != -1) {
      final currentQty = (_cartItems[index]['quantity'] as num?)?.toInt() ?? 1;
      final addedQty = (product['quantity'] as num?)?.toInt() ?? 1;
      _cartItems[index]['quantity'] = currentQty + addedQty;
    } else {
      _cartItems.add(Map<String, dynamic>.from(product));
    }
    _emitUpdatedState();
  }

  void removeFromCartAtIndex(int index) {
    if (index >= 0 && index < _cartItems.length) {
      _cartItems.removeAt(index);
      _emitUpdatedState();
    }
  }

  void updateQuantityAtIndex(int index, int newQuantity) {
    if (index >= 0 && index < _cartItems.length) {
      if (newQuantity <= 0) {
        removeFromCartAtIndex(index);
      } else {
        _cartItems[index]['quantity'] = newQuantity;
        _emitUpdatedState();
      }
    }
  }

  void _emitUpdatedState() {
    double total = 0.0;
    for (var item in _cartItems) {
      final priceStr = (item['price'] as String? ?? '0')
          .replaceAll(',', '')
          .replaceAll('EGP', '')
          .trim();
      final price = double.tryParse(priceStr) ?? 0.0;
      final quantity = (item['quantity'] as num?)?.toInt() ?? 1;
      total += price * quantity;
    }

    emit(CartUpdated(items: List.from(_cartItems), totalPrice: total));
  }
}

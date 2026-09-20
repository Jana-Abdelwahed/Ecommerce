import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final List<Map<String, dynamic>> _items = [];

  WishlistCubit() : super(WishlistInitial());

  List<Map<String, dynamic>> get items => List.unmodifiable(_items);

  bool isFavorite(String id) {
    return _items.any((item) => item['id'] == id);
  }

  void toggleFavorite(Map<String, dynamic> product) {
    final String productId = product['id']?.toString() ?? '';
    final index = _items.indexWhere((item) => item['id'] == productId);

    if (index != -1) {
      _items.removeAt(index);
    } else {
      _items.add({
        "id": productId,
        "title": product["title"] ?? "Product",
        "image": product["image"] ?? "",
        "price": product["price"] ?? "0",
        "oldPrice": product["oldPrice"],
        "colorName": product["colorName"] ?? "Black color",
        "colorCode": product["colorCode"] is Color
            ? product["colorCode"]
            : const Color(0xFF2B2B2B),
      });
    }

    emit(WishlistUpdated(List.from(_items)));
  }

  void addToWishlist(Map<String, dynamic> item) {
    final String productId = item['id']?.toString() ?? '';
    if (!isFavorite(productId)) {
      _items.add(item);
      emit(WishlistUpdated(List.from(_items)));
    }
  }

  void removeFromWishlist(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      emit(WishlistUpdated(List.from(_items)));
    }
  }
}

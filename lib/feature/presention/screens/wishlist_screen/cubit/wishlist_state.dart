abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistUpdated extends WishlistState {
  final List<Map<String, dynamic>> items;
  WishlistUpdated(this.items);
}

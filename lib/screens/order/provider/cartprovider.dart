import 'package:assignment_app/screens/order/model/productmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    state = [...state, product];
  }

  void removeFromCart(String id) {
    state = state.where((product) => product.id != id).toList();
  }
}

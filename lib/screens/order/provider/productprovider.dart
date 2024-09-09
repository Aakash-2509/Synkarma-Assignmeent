import 'package:assignment_app/screens/order/model/productmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsProvider =
    StateNotifierProvider<ProductsNotifier, List<Product>>((ref) {
  return ProductsNotifier();
});

class ProductsNotifier extends StateNotifier<List<Product>> {
  ProductsNotifier() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }

  void updateProduct(String id, Product updatedProduct) {
    state = [
      for (final product in state)
        if (product.id == id) updatedProduct else product,
    ];
  }

  void deleteProduct(String id) {
    state = state.where((product) => product.id != id).toList();
  }
}

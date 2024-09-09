import 'package:assignment_app/screens/order/model/productmodel.dart';
import 'package:assignment_app/screens/order/provider/cartprovider.dart';
import 'package:assignment_app/screens/order/provider/productprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class OrdersTab extends ConsumerWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);

    return Scaffold(
      body: products.isEmpty
          ? const Center(child: Text('Add product below'))
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _editProduct(context, ref, product),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => ref
                            .read(productsProvider.notifier)
                            .deleteProduct(product.id),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          ref.read(cartProvider.notifier).addToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added to cart')),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addProduct(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }


  void _addProduct(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        String name = '';
        String price = '';
        return AlertDialog(
          title: const Text('Add Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Product Name'),
                onChanged: (value) => name = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                onChanged: (value) => price = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty && price.isNotEmpty) {
                  ref.read(productsProvider.notifier).addProduct(
                        Product(
                          id: DateTime.now().toString(),
                          name: name,
                          price: double.parse(price),
                        ),
                      );
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }


  void _editProduct(BuildContext context, WidgetRef ref, Product product) {
    String name = product.name;
    String price = product.price.toString();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Product Name'),
                onChanged: (value) => name = value,
                controller: TextEditingController(text: product.name),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                onChanged: (value) => price = value,
                controller:
                    TextEditingController(text: product.price.toString()),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty && price.isNotEmpty) {
                  ref.read(productsProvider.notifier).updateProduct(
                        product.id,
                        Product(
                          id: product.id,
                          name: name,
                          price: double.parse(price),
                        ),
                      );
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

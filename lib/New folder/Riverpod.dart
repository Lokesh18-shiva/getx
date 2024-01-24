// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Riverpo extends StatelessWidget {
  const Riverpo({super.key});

  @override
  Widget build(BuildContext context) {
    return const RiverHome();
  }
}

// ignore: non_constant_identifier_names
class Product {
  Product({required this.name, required this.price});

  final String name;
  final double price;
}

// Map Mapname = {
//   "name": 'iPhone',
// };
final _products = [
  Product(name: 'iPhone', price: 999),
  Product(name: 'cookie', price: 2),
  Product(name: 'ps5', price: 500),
  Product(name: 'iPhone', price: 999),
  Product(name: 'cookie', price: 2),
  Product(name: 'ps5', price: 500),
  Product(name: 'iPhone', price: 999),
  Product(name: 'cookie', price: 2),
  Product(name: 'ps5', price: 500),
  Product(name: 'iPhone', price: 999),
  Product(name: 'cookie', price: 2),
  Product(name: 'ps5', price: 500),
  Product(name: 'iPhone', price: 999),
  Product(name: 'cookie', price: 2),
  Product(name: 'ps5', price: 500),
  Product(name: 'iPhone', price: 999),
  Product(name: 'cookie', price: 2),
  Product(name: 'ps5', price: 500),
  Product(name: 'iPhone', price: 999),
  Product(name: 'cookie', price: 2),
  Product(name: 'ps5', price: 500),
  Product(name: 'iPhone', price: 999),
  Product(name: 'cookie', price: 2),
  Product(name: 'ps5', price: 500),
];
// ignore: non_constant_identifier_names
final RiverpodProviderSetVariable = StateProvider<List<Product>>((ref) {
  return _products;
});

class RiverHome extends ConsumerWidget {
  const RiverHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: deprecated_member_use, non_constant_identifier_names
    final RiverpodProviderGetVariable = ref.watch(RiverpodProviderSetVariable);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.read(RiverpodProviderSetVariable.notifier);
      }),
       body: 
      //Center(child: Text(RiverpodProviderGetVariable.toString())),
      ListView.builder(
          itemCount: RiverpodProviderGetVariable.length,
          itemBuilder: ((context, i) {
            final product = RiverpodProviderGetVariable[i];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(product.name),
                subtitle: Text(product.price.toString()),
              ),
            );
          })),
      // Text(RiverpodProviderGetVariable.toString()),
    );
  }
}

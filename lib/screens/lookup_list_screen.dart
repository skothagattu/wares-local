import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wares/providers/provider.dart';

import '../providers/provider_products.dart';
import 'datatable_products.dart';

class LookupListScreen extends StatelessWidget {
  const LookupListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Product List"),
        ),
        body: const Center(
          child: Column(
            children: [

              Expanded(child: ProductDataTable()), // Use the ProductDataTable here
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDataTable extends ConsumerWidget {
  const ProductDataTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listProducts = ref.watch(productList); // Make sure you have a productListProvider
    return listProducts.when(
      data: (products) {
        return ProductTable(products: products.data.items); // Use the ProductTable widget here
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (err, stack) => Text('Error $err'),
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wares/models/products.dart';
import 'package:wares/repositories/products_repository.dart';

import '../models/products_submission.dart';
import '../providers/provider_products.dart';

class ProductsNotifier extends StateNotifier<List<Product>> {
  final IProductRepository _repository;

  ProductsNotifier(this._repository) : super([]);

  Future<void> fetchProducts({int pageNumber = 1, int pageSize = 50, String? searchQuery}) async {
    try {
      final productListResponse = await _repository.fetchProductList(
        pageNumber: pageNumber,
        pageSize: pageSize,
        searchQuery: searchQuery,
      );
      state = [...state, ...productListResponse.data.items];
    } catch (e) {
      print('Failed to fetch products: $e');
    }
  }
  Future<void> updateProduct(String productNo, ProductSubmission productSubmission) async {
    try {
      final success = await _repository.updateProduct(productNo, productSubmission);
      if (success) {
        // Optionally, you can refetch the products list here to reflect the changes
        await fetchProducts();
      }
    } catch (e) {
      print('Failed to update product: $e');
    }
  }


}

final productsProvider = StateNotifierProvider<ProductsNotifier, List<Product>>((ref) {
  return ProductsNotifier(ref.watch(productsRepositoryProvider));
});

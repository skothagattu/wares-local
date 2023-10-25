import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wares/models/products.dart';
import 'package:wares/repositories/products_repository.dart';

final productsRepositoryProvider = Provider<IProductRepository>((ref)=> ProductRepository());
final productList = FutureProvider.autoDispose<ProductListResponse>((ref) async{
  final repository = ref.watch(productsRepositoryProvider);
  return repository.fetchProductList();
});

final updateProductProvider = FutureProvider.autoDispose.family<bool, Product>((ref, product) async {
  final repository = ref.watch(productsRepositoryProvider);
  return await repository.updateProduct(product);
});

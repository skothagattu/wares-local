import 'dart:convert';

import 'package:wares/models/products.dart';

import 'package:http/http.dart' as http;

abstract class IProductRepository {
  Future<ProductListResponse> fetchProductList();

}

class ProductRepository implements IProductRepository{
  final _host = "https://localhost:44363/api/Products/";
  final Map<String, String> _headers = {
    "Accept" : "application/json",
    "content-type": "application/json",
  };

  @override
  Future<ProductListResponse> fetchProductList({int pageNumber = 1, int pageSize = 50, String? searchQuery}) async {
    var getAllProductsUrl = _host + "GetAll?pageNumber=$pageNumber&pageSize=$pageSize";
    if (searchQuery != null && searchQuery.isNotEmpty) {
      getAllProductsUrl += "&searchQuery=$searchQuery";
    }
    var results = await http.get(Uri.parse(getAllProductsUrl), headers: _headers);
    final jsonObject = json.decode(results.body);
    var response = ProductListResponse.fromJson(jsonObject);

    return response;
  }
}
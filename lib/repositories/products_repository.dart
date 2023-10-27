import 'dart:convert';

import 'package:wares/models/products.dart';

import 'package:http/http.dart' as http;
import 'package:wares/models/products_submission.dart';

abstract class IProductRepository {
  Future<ProductListResponse> fetchProductList();
  Future<bool> updateProduct(String productNo, ProductSubmission productSubmission);
}

class ProductRepository implements IProductRepository{
  final _host = "https://localhost:44363/api/Products";
  final Map<String, String> _headers = {
    "Accept" : "application/json",
    "content-type": "application/json",
  };

  @override
  Future<ProductListResponse> fetchProductList({int pageNumber = 1, int pageSize = 50, String? searchQuery}) async {
    var getAllProductsUrl = _host + "/GetAll?pageNumber=$pageNumber&pageSize=$pageSize";
    if (searchQuery != null && searchQuery.isNotEmpty) {
      getAllProductsUrl += "&searchQuery=$searchQuery";
    }
    var results = await http.get(Uri.parse(getAllProductsUrl), headers: _headers);
    /*print('Raw JSON response: ${results.body}');*/
    final jsonObject = json.decode(results.body);
    var response = ProductListResponse.fromJson(jsonObject);
/*    print('ProductListResponse object: $response');*/

    return response;
  }

  @override
  Future<bool> updateProduct(String productNo,ProductSubmission productSubmission) async {
    final url = Uri.parse('$_host/updateProduct/$productNo'); // Adjust the URL as needed
    final productMap = productSubmission.toJson();
print(url);
    final response = await http.post(
      url,
      headers: _headers,
      body: json.encode(productMap),
     // Ensure your Product model has a toJson method
    );
    print(json.encode(productMap));
    return response.statusCode == 200; // Adjust as needed based on your API's response
  }
}
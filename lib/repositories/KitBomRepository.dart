import 'dart:convert';
import '../models/KitBomItem.dart';
import 'package:http/http.dart' as http;

abstract class IKitBomRepository {
  Future<List<KitBomItem>> fetchKitBomItems(String kitNo);
  Future<List<KitBomItem>> fetchKitBomItemsWithId(String kitNo);
  Future<bool> createKitBom(String kitNo, List<KitBomItem> components);
  Future<bool> updateKitBom(String kitNo, List<KitBomItem> components);
}

class KitBomRepository implements IKitBomRepository {
  final _host = "https://localhost:44363/Kits";
  final Map<String, String> _headers = {
    "Accept": "application/json",
    "content-type": "application/json",
  };



  @override
  Future<List<KitBomItem>> fetchKitBomItems(String kitNo) async {
    final url = Uri.parse('$_host/$kitNo');
    final response = await http.get(url, headers: _headers);
    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> itemsJson = data['items'];
      return itemsJson.map((jsonItem) => KitBomItem.fromJson(jsonItem)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException('KitBom items not found for kit number $kitNo');
    } else {
      // Handle other errors
      throw Exception('Failed to load KitBom items');
    }
  }

  @override
  Future<List<KitBomItem>> fetchKitBomItemsWithId(String kitNo) async {
    final url = Uri.parse('$_host/GetWithId/$kitNo');
    final response = await http.get(url, headers: _headers);
    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> itemsJson = data['items'];
      return itemsJson.map((jsonItem) => KitBomItem.fromJson(jsonItem)).toList();
    } else {
      // Handle errors
      throw Exception('Failed to load KitBom items');
    }
  }
  @override
  Future<bool> createKitBom(String kitNo, List<KitBomItem> components) async {
    final url = Uri.parse('$_host/Create');
    final body = json.encode({
      "kitNo": kitNo,
      "components": components.map((item) => item.toJson()).toList(),
    });

    final response = await http.post(url, headers: _headers, body: body);

    if (response.statusCode == 200) {
      return true;
    } else {
      // Handle errors
      throw Exception('Failed to create KitBom');
    }
  }
  @override
  Future<bool> updateKitBom(String kitNo, List<KitBomItem> components) async {
    final url = Uri.parse('$_host/Update'); // Adjust the endpoint as needed
    final body = json.encode({
      "kitNo": kitNo,
      "components": components.map((item) => item.toJson()).toList(),
    });

    final response = await http.put(url, headers: _headers, body: body);

    if (response.statusCode == 200) {
      return true;
    } else {
      // Handle errors
      throw Exception('Failed to update KitBom');
    }
  }

}
class NotFoundException implements Exception {
  final String message;
  NotFoundException(this.message);

  @override
  String toString() => message;
}


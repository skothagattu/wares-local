import 'dart:convert';
import '../models/KitBomItem.dart';
import 'package:http/http.dart' as http;

abstract class IKitBomRepository {
  Future<List<KitBomItem>> fetchKitBomItems(String kitNo);
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
    } else {
      // Handle errors
      throw Exception('Failed to load KitBom items');
    }
  }
}

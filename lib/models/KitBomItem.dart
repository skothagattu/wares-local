class KitBomItem {
  final int id;
  final String productNo;
  final int quantity;
  final double listPrice;

  KitBomItem({this.id =0, required this.productNo, required this.quantity, required this.listPrice});

  factory KitBomItem.fromJson(Map<String, dynamic> json) {
    return KitBomItem(
      id: json['id'] ?? 0,
      productNo: json['productNo'],
      quantity: json['quantity'],
      listPrice: json['listPrice'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "productNo": productNo,
      "quantity": quantity,
      "listPrice": listPrice,
    };
  }
}

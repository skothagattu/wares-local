class KitBomItem {
  final int? id;
  final String productNo;
  final int quantity;
  final double? listPrice;

  KitBomItem({this.id =0, required this.productNo, required this.quantity, this.listPrice =0});

  factory KitBomItem.fromJson(Map<String, dynamic> json) {
    return KitBomItem(
      id: json['id'] ?? 0,
      productNo: json['productNo'] ??'',
      quantity: json['quantity'] ?? 0,
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

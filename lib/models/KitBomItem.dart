class KitBomItem {
  final String productNo;
  final int quantity;
  final double listPrice;

  KitBomItem({required this.productNo, required this.quantity, required this.listPrice});

  factory KitBomItem.fromJson(Map<String, dynamic> json) {
    return KitBomItem(
      productNo: json['productNo'],
      quantity: json['quantity'],
      listPrice: json['listPrice'],
    );
  }
}

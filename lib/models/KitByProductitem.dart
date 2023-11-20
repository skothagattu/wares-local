class KitByProductItem {
  final String kitNo;
  final int quantity;

  KitByProductItem({required this.kitNo, required this.quantity});

  factory KitByProductItem.fromJson(Map<String, dynamic> json) {
    return KitByProductItem(
      kitNo: json['kitNo'],
      quantity: json['quantity'],
    );
  }
}

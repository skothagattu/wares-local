class CompatModel {
  final int id;
  final String productNo;
  final String model;
  final String notes;

  CompatModel({
    required this.id,
    required this.productNo,
    required this.model,
    required this.notes,
  });

  factory CompatModel.fromJson(Map<String, dynamic> json) {
    return CompatModel(
      id: json['id'] as int? ?? 0, // Default to 0 if null
      productNo: json['productno'] as String? ?? '', // Default to empty string if null
      model: json['model'] as String? ?? '', // Default to empty string if null
      notes: json['notes'] as String? ?? '', // Default to empty string if null
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'PRODUCTNO': productNo,
      'MODEL': model,
      'NOTES': notes,
    };
  }

  @override
  String toString() {
    return 'CompatModel{id: $id, productNo: $productNo, model: $model, notes: $notes}';
  }

}


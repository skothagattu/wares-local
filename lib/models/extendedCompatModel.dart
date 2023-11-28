import 'compat.dart';

class ExtendedCompatModel extends CompatModel {
  String? description;
  String? configuration;
  String? comments;

  ExtendedCompatModel({
    required int id,
    required String productNo,
    required String model,
    required String notes,
    this.description,
    this.configuration,
    this.comments,
  }) : super(id: id, productNo: productNo, model: model, notes: notes);

// You can add a method to populate additional fields if needed
}

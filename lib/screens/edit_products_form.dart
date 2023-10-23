import 'package:flutter/material.dart';
import '../models/products.dart';

class EditProductForm extends StatefulWidget {
  final Product product;

  EditProductForm({required this.product});

  @override
  _EditProductFormState createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  late TextEditingController _productNoController;
  late TextEditingController _revController;
  late TextEditingController _alphaController;
  late TextEditingController _descriptionController;
  // ... Add controllers for other fields as needed

  @override
  void initState() {
    super.initState();
    _productNoController = TextEditingController(text: widget.product.productno);
    _revController = TextEditingController(text: widget.product.rev);
    _alphaController = TextEditingController(text: widget.product.alpha);
    _descriptionController = TextEditingController(text: widget.product.description);
    // ... Initialize other controllers as needed
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Product'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _productNoController,
              decoration: InputDecoration(labelText: 'Product No'),
            ),
            TextField(
              controller: _revController,
              decoration: InputDecoration(labelText: 'Rev'),
            ),
            TextField(
              controller: _alphaController,
              decoration: InputDecoration(labelText: 'Alpha'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            // ... Add TextFields for other fields as needed
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Update the product details here
            // For example, send a PUT request to your API
            Navigator.of(context).pop();
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}

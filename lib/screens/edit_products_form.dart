import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/products.dart';
import '../providers/provider_products.dart';

class EditProductForm extends StatefulWidget {
  final Product product;

  EditProductForm({required this.product});

  @override
  _EditProductFormState createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  late TextEditingController _idController;
  late TextEditingController _productNoController;
  late TextEditingController _revController;
  late TextEditingController _alphaController;
  late TextEditingController _descriptionController;
  late TextEditingController _configurationController;
  late TextEditingController _llcController;
  late TextEditingController _level1Controller;
  late TextEditingController _typeController;
  late TextEditingController _ecrController;
  late TextEditingController _listpriceController;
  late TextEditingController _commentsController;
  late TextEditingController _activeController;
  late TextEditingController _labelDescController;
  late TextEditingController _productSpecController;
  late TextEditingController _labelConfigController;
  late TextEditingController _dateReqController;
  late TextEditingController _dateDueController;
  late TextEditingController _level2Controller;
  late TextEditingController _level3Controller;
  late TextEditingController _level4Controller;
  late TextEditingController _level5Controller;
  late TextEditingController _sequenceNumController;
  late TextEditingController _locationWaresController;
  late TextEditingController _locationAccpacController;
  late TextEditingController _locationMisysController;
  late TextEditingController _level6Controller;
  late TextEditingController _level7Controller;
  late TextEditingController _instGuideController;



  // ... Add controllers for other fields as needed

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController(text: widget.product.id?.toString());
    _productNoController = TextEditingController(text: widget.product.productno);
    _revController = TextEditingController(text: widget.product.rev);
    _alphaController = TextEditingController(text: widget.product.alpha);
    _descriptionController = TextEditingController(text: widget.product.description);
    _configurationController = TextEditingController(text: widget.product.configuration);
    _llcController = TextEditingController(text: widget.product.llc?.toString() ?? '');
    _level1Controller = TextEditingController(text: widget.product.leveL1);
    _typeController = TextEditingController(text: widget.product.type);
    _ecrController = TextEditingController(text: widget.product.ecr);
    _listpriceController =TextEditingController(text: widget.product.listprice?.toString() ?? '');
    _commentsController = TextEditingController(text: widget.product.comments);
    _activeController = TextEditingController(text: widget.product.active);
    _labelDescController = TextEditingController(text: widget.product.labeL_DESC);
    _productSpecController = TextEditingController(text: widget.product.producT_SPEC);
    _labelConfigController = TextEditingController(text: widget.product.labeL_CONFIG);
    _dateReqController = TextEditingController(text: widget.product.datE_REQ);
    _dateDueController = TextEditingController(text: widget.product.datE_DUE);
    _level2Controller = TextEditingController(text: widget.product.level2);
    _level3Controller = TextEditingController(text: widget.product.level3);
    _level4Controller = TextEditingController(text: widget.product.level4);
    _level5Controller = TextEditingController(text: widget.product.level5);
    _sequenceNumController = TextEditingController(text: widget.product.sequenceNum?.toString() ?? '');
    _locationWaresController = TextEditingController(text: widget.product.locationWares);
    _locationAccpacController = TextEditingController(text: widget.product.locationAccpac);
    _locationMisysController = TextEditingController(text: widget.product.locationMisys);
    _level6Controller = TextEditingController(text: widget.product.level6);
    _level7Controller = TextEditingController(text: widget.product.level7);
    _instGuideController = TextEditingController(text: widget.product.instGuide);

    // ... Initialize other controllers as needed
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return AlertDialog(
          title: Text('Edit Product'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _idController,
                  decoration: InputDecoration(labelText: 'ID'),
                ),
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
                TextField(
                  controller: _configurationController,
                  decoration: InputDecoration(labelText: 'Configuratin'),
                ),
                TextField(
                  controller: _llcController,
                  decoration: InputDecoration(labelText: 'llc'),
                ),
                TextField(
                  controller: _level1Controller,
                  decoration: InputDecoration(labelText: 'level1'),
                ),
                TextField(
                  controller: _typeController,
                  decoration: InputDecoration(labelText: 'type'),
                ),
                TextField(
                  controller: _ecrController,
                  decoration: InputDecoration(labelText: 'ecr'),
                ),
                TextField(
                  controller: _listpriceController,
                  decoration: InputDecoration(labelText: 'listprice'),
                ),
                TextField(
                  controller: _commentsController,
                  decoration: InputDecoration(labelText: 'comments'),
                ),
                TextField(
                  controller: _activeController,
                  decoration: InputDecoration(labelText: 'active'),
                ),
                TextField(
                  controller: _labelDescController,
                  decoration: InputDecoration(labelText: 'labelDesc'),
                ),
                TextField(
                  controller: _productSpecController,
                  decoration: InputDecoration(labelText: 'productSpec'),
                ),
                TextField(
                  controller: _labelConfigController,
                  decoration: InputDecoration(labelText: 'labelConfig'),
                ),
                TextField(
                  controller: _dateReqController,
                  decoration: InputDecoration(labelText: 'dateReq'),
                ),
                TextField(
                  controller: _dateDueController,
                  decoration: InputDecoration(labelText: 'dateDue'),
                ),
                TextField(
                  controller: _level2Controller,
                  decoration: InputDecoration(labelText: 'level2'),
                ),
                TextField(
                  controller: _level3Controller,
                  decoration: InputDecoration(labelText: 'level3'),
                ),
                TextField(
                  controller: _level4Controller,
                  decoration: InputDecoration(labelText: 'level4'),
                ),
                TextField(
                  controller: _level5Controller,
                  decoration: InputDecoration(labelText: 'level5'),
                ),
                TextField(
                  controller: _sequenceNumController,
                  decoration: InputDecoration(labelText: 'sequenceNum'),
                ),
                TextField(
                  controller: _locationWaresController,
                  decoration: InputDecoration(labelText: 'locationWares'),
                ),
                TextField(
                  controller: _locationAccpacController,
                  decoration: InputDecoration(labelText: 'locationAccpac'),
                ),
                TextField(
                  controller: _locationMisysController,
                  decoration: InputDecoration(labelText: 'locationMisys'),
                ),
                TextField(
                  controller: _level6Controller,
                  decoration: InputDecoration(labelText: 'level6'),
                ),
                TextField(
                  controller: _level7Controller,
                  decoration: InputDecoration(labelText: 'level7'),
                ),
                TextField(
                  controller: _instGuideController,
                  decoration: InputDecoration(labelText: 'instGuide'),
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
                final product = Product(
                  id: widget.product.id ?? (throw 'Product ID is null'),
                  productno: _productNoController.text,
                  rev: _revController.text,
                  alpha: _alphaController.text,
                  description: _descriptionController.text,
                    configuration: _configurationController.text,
                  llc: int.tryParse(_llcController.text),
                  leveL1: _level1Controller.text,
                  type: _typeController.text,
                  ecr: _ecrController.text,
                  listprice: int.tryParse(_listpriceController.text),
                  comments: _commentsController.text,
                  active: _activeController.text,
                  labeL_DESC: _labelDescController.text,
                  producT_SPEC: _productSpecController.text,
                  labeL_CONFIG: _labelConfigController.text,
                  datE_REQ: _dateReqController.text,
                  datE_DUE: _dateDueController.text,
                  level2: _level2Controller.text,
                  level3: _level3Controller.text,
                  level4: _level4Controller.text,
                  level5: _level5Controller.text,
                  sequenceNum: int.tryParse(_sequenceNumController.text),
                  locationWares: _locationWaresController.text,
                  locationAccpac: _locationAccpacController.text,
                  locationMisys: _locationMisysController.text,
                  instGuide: _instGuideController.text,
                  // ... Set other fields as needed
                );
                ref.read(updateProductProvider(product).future).then((success) {
                  if (success) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Product updated successfully!')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to update product')),
                    );
                  }
                });
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

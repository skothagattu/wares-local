import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';
import 'package:wares/models/products_submission.dart';
import '../models/products.dart';
import '../providers/provider_products.dart';

class EditProductForm extends StatefulWidget {
  final ProductSubmission productSubmission;

  EditProductForm({required this.productSubmission});


  @override
  _EditProductFormState createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  late TextEditingController _revController;
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
    _revController = TextEditingController(text: widget.productSubmission.rev);
    _descriptionController = TextEditingController(text: widget.productSubmission.description);
    _configurationController = TextEditingController(text: widget.productSubmission.configuration);
    _llcController = TextEditingController(text: widget.productSubmission.llc?.toString() ?? '');
    _level1Controller = TextEditingController(text: widget.productSubmission.level1);
    _typeController = TextEditingController(text: widget.productSubmission.type);
    _ecrController = TextEditingController(text: widget.productSubmission.ecr);
    _listpriceController =TextEditingController(text: widget.productSubmission.listprice?.toString() ?? '');
    _commentsController = TextEditingController(text: widget.productSubmission.comments);
    _activeController = TextEditingController(text: widget.productSubmission.active);
    _labelDescController = TextEditingController(text: widget.productSubmission.labelDesc);
    _productSpecController = TextEditingController(text: widget.productSubmission.productSpec);
    _labelConfigController = TextEditingController(text: widget.productSubmission.labelConfig);
    _dateReqController = TextEditingController(text: widget.productSubmission.dateReq);
    _dateDueController = TextEditingController(text: widget.productSubmission.dateDue);
    _level2Controller = TextEditingController(text: widget.productSubmission.level2);
    _level3Controller = TextEditingController(text: widget.productSubmission.level3);
    _level4Controller = TextEditingController(text: widget.productSubmission.level4);
    _level5Controller = TextEditingController(text: widget.productSubmission.level5);
    _sequenceNumController = TextEditingController(text: widget.productSubmission.sequenceNum?.toString() ?? '');
    _locationWaresController = TextEditingController(text: widget.productSubmission.locationWares);
    _locationAccpacController = TextEditingController(text: widget.productSubmission.locationAccpac);
    _locationMisysController = TextEditingController(text: widget.productSubmission.locationMisys);
    _level6Controller = TextEditingController(text: widget.productSubmission.level6);
    _level7Controller = TextEditingController(text: widget.productSubmission.level7);
    _instGuideController = TextEditingController(text: widget.productSubmission.instGuide);

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
                Row(
                  children: [
                    Text('ID: '),
                    Text(widget.productSubmission.id?.toString() ?? 'N/A'),
                  ],
                ),
                Row(
                  children: [
                    Text('Product No: '),
                    Text(widget.productSubmission.productno ?? 'N/A'),
                  ],
                ),
                TextField(
                  controller: _revController,
                  decoration: InputDecoration(labelText: 'Rev'),
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
                  decoration: InputDecoration(labelText: 'leve2'),
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
                final productNo = widget.productSubmission.productno ?? (throw 'Product No is null');
                final UpdateProductSubmission = ProductSubmission(
                  rev: _emptyToNull(_revController.text),
                  description: _emptyToNull(_descriptionController.text),
                  configuration: _emptyToNull(_configurationController.text),
                  llc: _emptyToNull(_llcController.text),
                  level1: _emptyToNull(_level1Controller.text),
                  type: _emptyToNull(_typeController.text),
                  ecr: _emptyToNull(_ecrController.text),
                  listprice: _emptyToNull(_listpriceController.text),
                  comments: _emptyToNull(_commentsController.text),
                  active: _emptyToNull(_activeController.text),
                  labelDesc: _emptyToNull(_labelDescController.text),
                  productSpec: _emptyToNull(_productSpecController.text),
                  labelConfig: _emptyToNull(_labelConfigController.text),
                  dateReq: _emptyToNull(_dateReqController.text),
                  dateDue: _emptyToNull(_dateDueController.text),
                  level2: _emptyToNull(_level2Controller.text),
                  level3: _emptyToNull(_level3Controller.text),
                  level4: _emptyToNull(_level4Controller.text),
                  level5: _emptyToNull(_level5Controller.text),
                  sequenceNum: _emptyToNull(_sequenceNumController.text),
                  locationWares: _emptyToNull(_locationWaresController.text),
                  locationAccpac: _emptyToNull(_locationAccpacController.text),
                  locationMisys: _emptyToNull(_locationMisysController.text),
                  level6: _emptyToNull(_level6Controller.text),
                  level7: _emptyToNull(_level7Controller.text),
                  instGuide: _emptyToNull(_instGuideController.text),
                  // ... Set other fields as needed
                );
          /*      print('Updated Product: $UpdateProductSubmission');*/


                ref.read(updateProductProvider(Tuple2(productNo, UpdateProductSubmission)).future).then((success) {
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
                }).catchError((error) {
                  print('An error occurred: $error');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('An error occurred while updating the product')),
                  );
                });
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
  String? _emptyToNull(String? input) {
    if (input == null || input.trim().isEmpty) {
      return null;
    }
    return input;
  }

}

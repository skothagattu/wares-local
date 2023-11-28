import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wares/models/compat.dart';
import 'package:wares/models/products.dart';
import 'package:wares/repositories/compat_repository.dart';
import 'package:wares/repositories/products_repository.dart';
import '../models/extendedCompatModel.dart';

class CompatForm extends StatefulWidget {
  @override
  _CompatFormState createState() => _CompatFormState();
}

class _CompatFormState extends State<CompatForm> {
  final CompatRepository _compatRepository = CompatRepository();
  final ProductRepository _productRepository = ProductRepository();
  List<String> _models = [];
  List<String> _productTypes = [];
  String? _selectedModel;
  String? _selectedProductType;
  List<ExtendedCompatModel> _extendedCompatProducts = [];
  Map<int, OverlayEntry?> _commentOverlays = {};
  Map<int, bool> _activeCommentIcons = {};
  final LayerLink _layerLink = LayerLink();
  Map<int, LayerLink> _layerLinks = {};
  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  void _loadInitialData() async {
    final models = await _compatRepository.fetchDistinctModels();
    final productTypes = await _compatRepository.fetchDistinctProductTypes();
    setState(() {
      _models = models;
      _productTypes = productTypes;
    });
  }

  void _fetchProducts() async {
    if (_selectedModel != null && _selectedProductType != null) {
      try {
        final compatProducts = await _compatRepository.fetchProductsByModelAndType(_selectedModel!, _selectedProductType!);
        final extendedProducts = await _populateProductDetails(compatProducts);
        setState(() {
          _extendedCompatProducts = extendedProducts;
        });
      } catch (e) {
        print('Error fetching products: $e');
      }
    } else {
      print('Model or Product Type not selected');
    }
  }

  Future<List<ExtendedCompatModel>> _populateProductDetails(List<CompatModel> compatProducts) async {
    List<ExtendedCompatModel> extendedProducts = [];
    for (var product in compatProducts) {
      try {
        final productDetails = await _productRepository.fetchProductDetails(product.productNo);
        extendedProducts.add(ExtendedCompatModel(
          id: product.id,
          productNo: product.productNo,
          model: product.model,
          notes: product.notes,
          description: productDetails.description,
          configuration: productDetails.configuration,
          comments: productDetails.comments,
        ));
      } catch (e) {
        // Handle exceptions or errors in fetching product details
      }
    }
    return extendedProducts;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double formWidth = screenWidth * 0.9;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/logo_cmi.png'),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 50),
          child: Container(
            width: formWidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Center(child: Text("PRODUCT COMPATIBILITY", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                  SizedBox(height: 20),
                  _buildDropdown('Select Model', _models, (value) {
                    setState(() {
                      _selectedModel = value;
                      _fetchProducts();
                    });
                  }),
                  _buildDropdown('Select Product Type', _productTypes, (value) {
                    setState(() {
                      _selectedProductType = value;
                      _fetchProducts();
                    });
                  }),
                  SizedBox(height: 20),
                  _buildDataTable(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String hint, List<String> items, ValueChanged<String?> onChanged) {
    return DropdownButton<String>(
      hint: Text(hint),
      value: hint == 'Select Model' ? _selectedModel : _selectedProductType,
      onChanged: (String? newValue) {
        if (newValue == null || newValue == 'Select Model' || newValue == 'Select Product Type') {
          return;
        }
        setState(() {
          if (hint == 'Select Model') {
            _selectedModel = newValue;
          } else {
            _selectedProductType = newValue;
          }
          if (_selectedModel != null && _selectedProductType != null) {
            _fetchProducts();
          }
        });
      },
      items: [
        DropdownMenuItem<String>(
          value: null,
          child: Text(hint),
          enabled: false,
        ),
        ...items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ],
    );
  }


  Widget _buildDataTable() {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(label: Text('Product No')),
        DataColumn(label: Text('Description')),
        DataColumn(label: Text('Configuration')),
        DataColumn(label: Text('Comments')),
        DataColumn(label: Text('Notes')),
      ],
      rows: List<DataRow>.generate(
        _extendedCompatProducts.length,
            (index) => DataRow(cells: <DataCell>[
          DataCell(_buildTextCell(_extendedCompatProducts[index].productNo)),
          DataCell(_buildTextCell(_extendedCompatProducts[index].description ?? '')),
          DataCell(_buildTextCell(_extendedCompatProducts[index].configuration ?? '')),
          DataCell(
            Builder(
              builder: (cellContext) => _buildCommentButtonCell(_extendedCompatProducts[index].comments ?? '', index, cellContext),
            ),
          ),
          DataCell(_buildTextCell(_extendedCompatProducts[index].notes)),
        ]),
      ),
    );
  }

  Widget _buildCommentButtonCell(String base64Comment, int index, BuildContext cellContext) {
    return IconButton(
      icon: Icon(Icons.comment, color: _activeCommentIcons[index] == true ? Colors.blue : null),
      onPressed: () => _toggleCommentOverlay(base64Comment, index, cellContext),
    );
  }

  void _toggleCommentOverlay(String base64Comment, int index, BuildContext cellContext) {
    if (_commentOverlays[index] != null) {
      _commentOverlays[index]?.remove();
      _commentOverlays[index] = null;
      _activeCommentIcons[index] = false;
    } else {
      _activeCommentIcons[index] = true;
      String decodedComment = decodeBase64String(base64Comment);
      OverlayEntry overlayEntry = _createCommentOverlayEntry(decodedComment, cellContext, index);
      Overlay.of(cellContext)?.insert(overlayEntry);
      _commentOverlays[index] = overlayEntry;
    }
    setState(() {}); // Update the UI
  }

  OverlayEntry _createCommentOverlayEntry(String decodedComment, BuildContext cellContext, int index) {
    RenderBox renderBox = cellContext.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy,
        left: offset.dx - 200, // Adjust this value as needed
        child: Material(
          elevation: 4.0,
          child: Container(
            width: 200, // Adjust width as needed
            padding: EdgeInsets.all(8.0),
            child: Text(decodedComment),
          ),
        ),
      ),
    );
  }


  String decodeBase64String(String base64String) {
    if (base64String.isEmpty) {
      return "";
    }
    try {
      String decodedString = utf8.decode(base64.decode(base64String));
      decodedString = decodedString.replaceAll('\n', ' ').replaceAll('\r', ' ');
      return decodedString.trim();
    } catch (e) {
      print("Error decoding Base64 string: $e");
      return "Error in decoding";
    }
  }

  Widget _buildTextCell(String text) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 100,
        maxWidth: 200,
      ),
      child: Tooltip(
        message: text,
        child: Text(
          text,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
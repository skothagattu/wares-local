import 'package:flutter/material.dart';
import 'package:wares/models/KitBomItem.dart';

import '../repositories/KitBomRepository.dart';

class AddKitForm extends StatefulWidget {
  @override
  _AddKitFormState createState() => _AddKitFormState();
}

class _AddKitFormState extends State<AddKitForm> {
  TextEditingController kitNumberController = TextEditingController();
  List<Map<String, TextEditingController>> componentControllers = [];

  @override
  void initState() {
    super.initState();
    // Initialize with one row
    _addNewComponentRow();
  }

  void _addNewComponentRow() {
    setState(() {
      componentControllers.add({
        "productNumber": TextEditingController(),
        "quantity": TextEditingController(),
        "listPrice": TextEditingController(),
      });
    });
  }

  void _removeComponentRow(int index) {
    setState(() {
      componentControllers.removeAt(index);
    });
  }
  final IKitBomRepository _kitBomRepository = KitBomRepository();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Add a key for Scaffold

  void _clearForm() {
    kitNumberController.clear();
    setState(() {
      componentControllers.clear();
      _addNewComponentRow(); // Add at least one row back
    });
  }

  void _handleSubmit() async {
    String kitNumber = kitNumberController.text;
    List<KitBomItem> components = componentControllers.map((controllers) {
      return KitBomItem(
        productNo: controllers["productNumber"]!.text,
        quantity: int.tryParse(controllers["quantity"]!.text) ?? 0,
        listPrice: double.tryParse(controllers["listPrice"]!.text) ?? 0.0,
      );
    }).toList();

    try {
      bool result = await _kitBomRepository.createKitBom(kitNumber, components);
      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("KitBom created successfully")),
        );
        _clearForm();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to create KitBom")),
        );
      }
    } catch (e) {
      String errorMessage = "Error occurred";
      if (e is CustomApiException) { // Replace with your actual exception class
        errorMessage = e.message; // Assuming your exception has a 'message' field
      } else if (e is FormatException) {
        errorMessage = "Invalid format";
      } // Add more specific exceptions if needed

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double formWidth = screenWidth * 0.6;

    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 50),
            child: Container(
              width: formWidth,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text("CREATE KIT", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                    SizedBox(height: 20),
                    TextField(
                      controller: kitNumberController,
                      decoration: InputDecoration(
                        labelText: 'Kit Number',
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Components", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    ...componentControllers.asMap().map((index, controllers) => MapEntry(index, Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controllers["productNumber"]!,
                            decoration: InputDecoration(labelText: 'Product Number'),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: controllers["quantity"]!,
                            decoration: InputDecoration(labelText: 'Quantity'),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: controllers["listPrice"]!,
                            decoration: InputDecoration(labelText: 'List Price'),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          onPressed: () => _removeComponentRow(index),
                        ),
                      ],
                    ))).values.toList(),
                    TextButton(
                      onPressed: _addNewComponentRow,
                      child: Text("Add Component"),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: _handleSubmit,
                            child: Text('Submit'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _clearForm,
                            child: Text('Clear'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey, // Set a different color for the clear button
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }

}
class CustomApiException implements Exception {
  final String message;
  final int? statusCode;

  CustomApiException(this.message, {this.statusCode});

  @override
  String toString() => 'CustomApiException: $message';
}


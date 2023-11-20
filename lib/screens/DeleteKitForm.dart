import 'package:flutter/material.dart';

import '../models/KitBomItem.dart';
import '../repositories/KitBomRepository.dart';

class DeleteKitForm extends StatefulWidget {
  @override
  _DeleteKitFormState createState() => _DeleteKitFormState();
}

class _DeleteKitFormState extends State<DeleteKitForm> {
  TextEditingController kitNumberController = TextEditingController();
  List<KitComponent> components = []; // List to hold kit components
  final IKitBomRepository _kitBomRepository = KitBomRepository();
  List<Map<String, TextEditingController>> componentControllers = [];

  @override
  void initState() {
    super.initState();
    // Initialize with one row
    _addNewComponentRow();
  }


  List<Map<String, TextEditingController>> newComponentControllers = [];

  void _addNewComponentRow({bool isNew = true}) {
    setState(() {
      var controllerSet = {
        "productNumber": TextEditingController(),
        "quantity": TextEditingController(),
        "listPrice": TextEditingController(),
      };
      if (isNew) {
        newComponentControllers.add(controllerSet);
      } else {
        componentControllers.add(controllerSet);
      }
    });
  }

  void _handleSubmit() async {
    String kitNumber = kitNumberController.text;
    List<KitBomItem> components = componentControllers.map((controllers) {
      return KitBomItem(
        id: int.tryParse(controllers["id"]!.text) ?? 0,
        productNo: controllers["productNumber"]!.text,
        quantity: int.tryParse(controllers["quantity"]!.text) ?? 0,
        listPrice: double.tryParse(controllers["listPrice"]!.text) ?? 0.0,
      );
    }).toList();
    List<KitBomItem> newComponents = newComponentControllers.map((controllers) {
      return KitBomItem(
        productNo: controllers["productNumber"]!.text,
        quantity: int.tryParse(controllers["quantity"]!.text) ?? 0,
        listPrice: double.tryParse(controllers["listPrice"]!.text) ?? 0.0,
      );
    }).toList();

    try {
      bool updateResult = await _kitBomRepository.updateKitBom(kitNumber, components);
      bool createResult = await _kitBomRepository.createKitBom(kitNumber, newComponents);

      if (updateResult && createResult) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("KitBom updated successfully")),
        );
        fetchAndDisplayKitComponents(kitNumber); // Reload the data
        setState(() {
          newComponentControllers.clear(); // Clear the additional rows
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to update KitBom")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error occurred: $e")),
      );
    }
  }


  void _clearForm() {
    setState(() {
      kitNumberController.clear();
      componentControllers.clear();
      newComponentControllers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double formWidth = screenWidth * 0.6;

    return SingleChildScrollView(
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
          child:  Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(child: Text("DELETE KIT", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: kitNumberController,
                        decoration: InputDecoration(labelText: 'Kit Number'),
                        onSubmitted: (value) => fetchAndDisplayKitComponents(value),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => fetchAndDisplayKitComponents(kitNumberController.text),
                      child: Text('Get Details'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                if (componentControllers.isNotEmpty) ...[
                  createComponentsDataTable(),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _deleteEntireKit,
                        child: Text('Delete Kit'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Optional: Style for the delete kit button
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: _clearForm,
                        child: Text('Clear'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey, // Optional: Style for the clear button
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),

        ),
      ),
    );
  }

  void fetchAndDisplayKitComponents(String kitNumber) async {
    try {
      List<KitBomItem> fetchedComponents = await _kitBomRepository.fetchKitBomItemsWithId(kitNumber);
      if (fetchedComponents.isEmpty) {
        // No components found for the given kit number
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Kit number $kitNumber does not exist in KitBom")),
        );
        setState(() {
          componentControllers.clear(); // Clear any existing data
        });
      } else {
        // Components found, populate the form
        setState(() {
          componentControllers.clear();
          for (var component in fetchedComponents) {
            componentControllers.add({
              "id": TextEditingController(text: component.id.toString()),
              "productNumber": TextEditingController(text: component.productNo),
              "quantity": TextEditingController(text: component.quantity.toString()),
              "listPrice": TextEditingController(text: component.listPrice.toString()),
            });
          }
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error occurred: $e")),
      );
    }
  }



  Widget createComponentsDataTable() {
    var componentRows = componentControllers.map((controllers) {
      return DataRow(
        cells: <DataCell>[
          DataCell(TextField(controller: controllers["id"], enabled: false)),
          DataCell(TextField(controller: controllers["productNumber"])),
          DataCell(TextField(controller: controllers["quantity"])),
          DataCell(TextField(controller: controllers["listPrice"])),
          DataCell(
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteKitComponent(kitNumberController.text, controllers["productNumber"]!.text),
            ),
          ),
        ],
      );
    }).toList();

    return DataTable(
      columns: const <DataColumn>[
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Product Number')),
        DataColumn(label: Text('Quantity')),
        DataColumn(label: Text('List Price')),
        DataColumn(label: Text('Delete')), // New column for delete button
      ],
      rows: componentRows,
    );
  }

  void _deleteKitComponent(String id, String productNumber) async {
    // Show confirmation dialog
    bool confirmDelete = await _showDeleteConfirmationDialog();
    if (confirmDelete) {
      try {
        // Call the API to delete the component
        bool result = await _kitBomRepository.deleteKitComponent(kitNumberController.text, productNumber);
        if (result) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Component deleted successfully")),
          );
          // Refresh the data table
          fetchAndDisplayKitComponents(kitNumberController.text);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to delete component")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error occurred: $e")),
        );
      }
    }
  }

  Future<bool> _showDeleteConfirmationDialog() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text("Do you want to delete this component?"),
          actions: <Widget>[
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop(false); // Dismiss the dialog and return false
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop(true); // Dismiss the dialog and return true
              },
            ),
          ],
        );
      },
    ) ?? false; // In case the dialog is dismissed by tapping outside of it, return false
  }
  void _deleteEntireKit() async {
    bool confirmDelete = await _showDeleteConfirmationDialog();
    if (confirmDelete) {
      try {
        bool result = await _kitBomRepository.deleteKit(kitNumberController.text);
        if (result) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Kit deleted successfully")),
          );
          _clearForm(); // Clear the form after successful deletion
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to delete kit")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error occurred: $e")),
        );
      }
    }
  }
}


class KitComponent {
  String name;
  int quantity;

  KitComponent({required this.name, required this.quantity});
}

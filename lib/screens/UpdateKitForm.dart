import 'package:flutter/material.dart';

import '../models/KitBomItem.dart';
import '../repositories/KitBomRepository.dart';

class UpdateKitForm extends StatefulWidget {
  @override
  _UpdateKitFormState createState() => _UpdateKitFormState();
}

class _UpdateKitFormState extends State<UpdateKitForm> {
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


  void _addNewComponentRow() {
    setState(() {
      componentControllers.add({
        "productNumber": TextEditingController(),
        "quantity": TextEditingController(),
        "listPrice": TextEditingController(),
      });
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

    try {
      bool result = await _kitBomRepository.updateKitBom(kitNumber, components);
      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("KitBom updated successfully")),
        );
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              /*shrinkWrap: true,*/ // Important to prevent infinite height issue
              children: [
                Center(child: Text("UPDATE KIT", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                SizedBox(height: 20),
                TextField(
                  controller: kitNumberController,
                  decoration: InputDecoration(
                    labelText: 'Kit Number',
                  ),
                  onSubmitted: (value) {
                    fetchAndDisplayKitComponents(value);
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => fetchAndDisplayKitComponents(kitNumberController.text),
                  child: Text('Get Details'),
                ),
                SizedBox(height: 20),
                createComponentsDataTable(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _handleSubmit,
                  child: Text('Submit'),
                ),

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
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error occurred: $e")),
      );
    }
  }


  Widget createComponentsDataTable() {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Product Number')),
        DataColumn(label: Text('Quantity')),
        DataColumn(label: Text('List Price')),
      ],
      rows: componentControllers.map((controllers) {
        return DataRow(
          cells: <DataCell>[
            DataCell(TextField(controller: controllers["id"], enabled: false)), // ID field should be read-only
            DataCell(TextField(controller: controllers["productNumber"])),
            DataCell(TextField(controller: controllers["quantity"])),
            DataCell(TextField(controller: controllers["listPrice"])),
          ],
        );
      }).toList(),
    );
  }


}

class KitComponent {
  String name;
  int quantity;

  KitComponent({required this.name, required this.quantity});
}

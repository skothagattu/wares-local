import 'package:flutter/material.dart';
import '../models/KitBomItem.dart';
import '../models/KitByProductitem.dart';
import '../repositories/KitBomRepository.dart';

class SearchByProductForm extends StatefulWidget {
  @override
  _SearchByProductFormState createState() => _SearchByProductFormState();
}

class _SearchByProductFormState extends State<SearchByProductForm> {
  TextEditingController productNumberController = TextEditingController();
  final IKitBomRepository _kitBomRepository = KitBomRepository();
  List<KitByProductItem> kits = [];

  void _fetchKitsByProductNo() async {
    try {
      String productNo = productNumberController.text;
      List<KitByProductItem> fetchedKits = await _kitBomRepository.fetchKitsByProductNo(productNo);

      setState(() {
        kits = fetchedKits;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error occurred: $e")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: productNumberController,
              decoration: InputDecoration(labelText: 'Product Number'),
              onSubmitted: (_) => _fetchKitsByProductNo(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchKitsByProductNo,
              child: Text('Search Kits'),
            ),
            SizedBox(height: 20),
            if (kits.isNotEmpty) _createKitsDataTable(),
          ],
        ),
      ),
    );
  }

  Widget _createKitsDataTable() {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(label: Text('Kit Number')),
        DataColumn(label: Text('Quantity')),
      ],
      rows: kits.map((kit) => DataRow(
        cells: <DataCell>[
          DataCell(Text(kit.kitNo)),
          DataCell(Text(kit.quantity.toString())),
        ],
      )).toList(),
    );
  }
}

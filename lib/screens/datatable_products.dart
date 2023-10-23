import 'package:flutter/material.dart';
import 'package:resize/resize.dart';

import '../models/products.dart';
import '../repositories/products_repository.dart';
import 'edit_products_form.dart';

class ProductTable extends StatefulWidget {
  final List<Product> products;

  ProductTable({required this.products});

  @override
  _ProductTableState createState() => _ProductTableState();
}

class _ProductTableState extends State<ProductTable> {
  List<Product> displayedProducts = [];
  int currentPage = 1;
  final pageSize = 50;
  final scrollController = ScrollController();
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    displayedProducts = List.from(widget.products);
    _fetchProducts();
  }

  _loadMoreProducts() async {
    currentPage++;
    var newProducts = await ProductRepository().fetchProductList(pageNumber: currentPage, pageSize: pageSize);
    setState(() {
      displayedProducts.addAll(newProducts.data.items);
    });
  }

  _fetchProducts({String? searchQuery}) async {
    var newProducts = await ProductRepository().fetchProductList(searchQuery: searchQuery);
    setState(() {
      displayedProducts = newProducts.data.items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thickness: 15.0,
      thumbVisibility: true,
      controller: scrollController,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _fetchProducts(searchQuery: value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: scrollController,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('PRODUCTNO')),
                    DataColumn(label: Text('REV')),
                    DataColumn(label: Text('DESCRIPTION')),
                    DataColumn(label: Text('CONFIGURATION')),
                    DataColumn(label: Text('LLC')),
                    DataColumn(label: Text('LEVEL1')),
                    DataColumn(label: Text('TYPE')),
                    DataColumn(label: Text('ECR')),
                    DataColumn(label: Text('LISTPRICE')),
                    DataColumn(label: Text("COMMENTS")),
                    DataColumn(label: Text('ACTIVE')),
                    DataColumn(label: Text('LABEL_DESC')),
                    DataColumn(label: Text('PRODUCT_SPEC')),
                    DataColumn(label: Text('LABEL_CONFIG')),
                    DataColumn(label: Text('DATE_REQ')),
                    DataColumn(label: Text('DATE_DUE')),
                    DataColumn(label: Text('LEVEL2')),
                    DataColumn(label: Text('LEVEL3')),
                    DataColumn(label: Text('LEVEL4')),
                    DataColumn(label: Text('LEVEL5')),
                    DataColumn(label: Text('SEQUENCE_NUM')),
                    DataColumn(label: Text('LOCATION_WARES')),
                    DataColumn(label: Text('LOCATION_ACCPAC')),
                    DataColumn(label: Text('LOCATION_MISYS')),
                    DataColumn(label: Text('LEVEL6')),
                    DataColumn(label: Text('LEVEL7')),
                    DataColumn(label: Text('INST_GUIDE')),
                  ],
                  rows: displayedProducts
                      .map(
                        (product) => DataRow(cells: [
                      DataCell(Text(product.id.toString())),
                      DataCell(Text(product.productno)),
                      DataCell(Text(product.rev ?? 'N/A')),
                      DataCell(Text(product.description ?? 'N/A')),
                      DataCell(Text(product.configuration ?? 'N/A')),
                      DataCell(Text(product.llc?.toString() ?? 'N/A')),
                      DataCell(Text(product.level1 ?? 'N/A')),
                      DataCell(Text(product.type ?? 'N/A')),
                      DataCell(Text(product.ecr ?? 'N/A')),
                      DataCell(Text(product.listprice?.toString() ?? 'N/A')),
                      DataCell(Text(product.comments ?? 'N/A')),
                      DataCell(Text(product.active ?? 'N/A')),
                      DataCell(Text(product.labelDesc ?? 'N/A')),
                      DataCell(Text(product.productSpec ?? 'N/A')),
                      DataCell(Text(product.labelConfig ?? 'N/A')),
                      DataCell(Text(product.dateReq ?? 'N/A')),
                      DataCell(Text(product.dateDue ?? 'N/A')),
                      DataCell(Text(product.level2 ?? 'N/A')),
                      DataCell(Text(product.level3 ?? 'N/A')),
                      DataCell(Text(product.level4 ?? 'N/A')),
                      DataCell(Text(product.level5 ?? 'N/A')),
                      DataCell(Text(product.sequenceNum?.toString() ?? 'N/A')),
                      DataCell(Text(product.locationWares ?? 'N/A')),
                      DataCell(Text(product.locationAccpac ?? 'N/A')),
                      DataCell(Text(product.locationMisys ?? 'N/A')),
                      DataCell(Text(product.level6 ?? 'N/A')),
                      DataCell(Text(product.level7 ?? 'N/A')),
                      DataCell(Text(product.instGuide ?? 'N/A')),
                    ],
                      onSelectChanged: (isSelected) {
                          if (isSelected != null && isSelected) {
                                    showDialog(
                                context: context,
                          builder: (context) => EditProductForm(product: product),
                                   );
                         }
                                 },


                        ),
                  )
                      .toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: _loadMoreProducts,
                child: Text("Load More"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

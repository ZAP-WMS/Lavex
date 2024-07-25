import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BomAddItemModel {
  String title;
  String quantityType;
  int quantity;
  dynamic manage;

  BomAddItemModel({
    required this.title,
    required this.quantityType,
    required this.quantity,
  });

  factory BomAddItemModel.fromjson(Map<String, dynamic> json) {
    return BomAddItemModel(
        title: json['name'],
        quantityType: json['quantity Type'],
        quantity: json['Quantity']);
  }

  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell(columnName: 'name', value: title),
      DataGridCell(columnName: 'quantity Type', value: quantityType),
      DataGridCell(columnName: 'Quantity', value: quantity),
      DataGridCell(columnName: 'Manage', value: manage),
    ]);
  }
}

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BomModel {
  String? name;
  String? store;
  String? status;
  dynamic manage;

  BomModel({
    required this.name,
    required this.store,
    required this.status,
    required this.manage,
  });

  factory BomModel.fromjson(Map<String, dynamic> json) {
    return BomModel(
      name: json['Name'],
      store: json['Store'],
      status: json['Status'],
      manage: json['Manage'],
    );
  }

  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell(columnName: 'Name', value: name),
      DataGridCell(columnName: 'Store', value: store),
      DataGridCell(columnName: 'Status', value: status),
      DataGridCell(columnName: 'Manage', value: manage),
    ]);
  }
}

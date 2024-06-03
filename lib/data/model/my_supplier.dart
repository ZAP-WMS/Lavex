import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class MySuppllierModel {
  String? name;
  String? shortCode;
  String? mobileNo;
  String? area;
  String? location;
  String? manage;

  MySuppllierModel({
    required this.name,
    required this.shortCode,
    required this.mobileNo,
    required this.area,
    required this.location,
    required this.manage,
  });

  factory MySuppllierModel.fromjson(Map<String, dynamic> json) {
    return MySuppllierModel(
      name: json['Name'],
      shortCode: json['ShortCode'],
      mobileNo: json['Mobile Number'],
      area: json['Area'],
      location: json['Location'],
      manage: json['Manage'],
    );
  }

  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell(columnName: 'Name', value: name),
      DataGridCell(columnName: 'ShortCode', value: mobileNo),
      DataGridCell(columnName: 'Mobile Number', value: mobileNo),
      DataGridCell(columnName: 'Area', value: area),
      DataGridCell(columnName: 'Location', value: location),
      DataGridCell(columnName: 'Manage', value: manage),
    ]);
  }
}

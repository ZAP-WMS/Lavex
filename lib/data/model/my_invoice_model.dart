import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class MyInvoiceModel {
  String? number;
  String? date;
  String? clientName;
  String? type;
  String? status;
  String? gst;
  double? total;
  dynamic options;

  MyInvoiceModel(
      {required this.number,
      required this.date,
      required this.clientName,
      required this.type,
      required this.status,
      required this.gst,
      required this.total,
      required this.options});

  factory MyInvoiceModel.fromjson(Map<String, dynamic> json) {
    return MyInvoiceModel(
        number: json['number'],
        date: json['date'],
        clientName: json['clientName'],
        type: json['type'],
        status: json['status'],
        gst: json['gst'],
        total: json['total'],
        options: json['options']);
  }

  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell(columnName: 'number', value: number),
      DataGridCell(columnName: 'date', value: date),
      DataGridCell(columnName: 'clientName', value: clientName),
      DataGridCell(columnName: 'type', value: type),
      DataGridCell(columnName: 'status', value: status),
      DataGridCell(columnName: 'gst', value: total),
      DataGridCell(columnName: 'total', value: total),
      DataGridCell(columnName: 'options', value: options),
    ]);
  }
}

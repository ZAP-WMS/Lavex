// To parse this JSON data, do
//
//     final storeModel = storeModelFromJson(jsonString);

import 'dart:convert';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<StoreModel> storeModelFromJson(String str) =>
    List<StoreModel>.from(json.decode(str).map((x) => StoreModel.fromJson(x)));

String storeModelToJson(List<StoreModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreModel {
  String movementNumber;
  String movementType;
  String created;
  String fromStore;
  String toStore;
  String paymentStatus;
  String taxBase;
  String finalTotal;

  StoreModel({
    required this.movementNumber,
    required this.movementType,
    required this.created,
    required this.fromStore,
    required this.toStore,
    required this.paymentStatus,
    required this.taxBase,
    required this.finalTotal,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        movementNumber: json["movement_number"],
        movementType: json["movement_type"],
        created: json["created"],
        fromStore: json["from_store"],
        toStore: json["to_store"],
        paymentStatus: json["payment_status"],
        taxBase: json["tax_base"],
        finalTotal: json["final_total"],
      );

  Map<String, dynamic> toJson() => {
        "movement_number": movementNumber,
        "movement_type": movementType,
        "created": created,
        "from_store": fromStore,
        "to_store": toStore,
        "payment_status": paymentStatus,
        "tax_base": taxBase,
        "final_total": finalTotal,
      };

  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell(columnName: 'movement_number', value: movementNumber),
      DataGridCell(columnName: 'movement_type', value: movementType),
      DataGridCell(columnName: 'created', value: created),
      DataGridCell(columnName: 'from_store', value: fromStore),
      DataGridCell(columnName: 'to_store', value: toStore),
      DataGridCell(columnName: 'payment_status', value: paymentStatus),
      DataGridCell(columnName: 'tax_base', value: taxBase),
      DataGridCell(columnName: 'final_total', value: finalTotal),
    ]);
  }
}

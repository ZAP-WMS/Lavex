// To parse this JSON data, do
//
//     final itemMasterModel = itemMasterModelFromJson(jsonString);

import 'dart:convert';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<ItemMasterModel> itemMasterModelFromJson(String str) =>
    List<ItemMasterModel>.from(
        json.decode(str).map((x) => ItemMasterModel.fromJson(x)));

String itemMasterModelToJson(List<ItemMasterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemMasterModel {
  String id;
  String name;
  String itemCode;
  String quantity;
  String lowQuantity;
  String quantityType;
  String singlePrice;
  String gstRate;
  String stockStatus;
  String storeName;
  String category;
  String total;
  dynamic manage;

  ItemMasterModel({
    required this.id,
    required this.name,
    required this.itemCode,
    required this.quantity,
    required this.lowQuantity,
    required this.quantityType,
    required this.singlePrice,
    required this.gstRate,
    required this.stockStatus,
    required this.storeName,
    required this.category,
    required this.total,
  });

  factory ItemMasterModel.fromJson(Map<String, dynamic> json) =>
      ItemMasterModel(
        id: json["id"],
        name: json["name"],
        itemCode: json["item_code"],
        quantity: json["quantity"],
        lowQuantity: json["low_quantity"],
        quantityType: json["quantity_type"],
        singlePrice: json["single_price"],
        gstRate: json["gst_rate"],
        stockStatus: json["stock_status"],
        storeName: json["store_name"],
        category: json["category"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "item_code": itemCode,
        "quantity": quantity,
        "low_quantity": lowQuantity,
        "quantity_type": quantityType,
        "single_price": singlePrice,
        "gst_rate": gstRate,
        "stock_status": stockStatus,
        "store_name": storeName,
        "category": category,
        "total": total,
      };

  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell(columnName: 'id', value: id),
      DataGridCell(columnName: 'name', value: name),
      DataGridCell(columnName: 'item_code', value: itemCode),
      DataGridCell(columnName: 'quantity', value: quantity),
      DataGridCell(columnName: 'low_quantity', value: lowQuantity),
      DataGridCell(columnName: 'quantity_type', value: quantityType),
      DataGridCell(columnName: 'single_price', value: singlePrice),
      DataGridCell(columnName: 'gst_rate', value: gstRate),
      DataGridCell(columnName: 'stock_status', value: stockStatus),
      DataGridCell(columnName: 'store_name', value: storeName),
      DataGridCell(columnName: 'category', value: category),
      DataGridCell(columnName: 'total', value: total),
      DataGridCell(columnName: 'Manage', value: manage),
    ]);
  }
}

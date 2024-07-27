import 'dart:convert';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

PurchaseStoreModel purchaseStoreModelFromJson(String str) =>
    PurchaseStoreModel.fromJson(json.decode(str));

String purchaseStoreModelToJson(PurchaseStoreModel data) =>
    json.encode(data.toJson());

class PurchaseStoreModel {
  String? message;
  bool? success;
  List<PurchaseStoreItem>? data;

  PurchaseStoreModel({
    this.message,
    this.success,
    this.data,
  });

  factory PurchaseStoreModel.fromJson(Map<String, dynamic> json) =>
      PurchaseStoreModel(
        message: json["message"],
        success: json["success"],
        data: List<PurchaseStoreItem>.from(
            json["data"].map((x) => PurchaseStoreItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PurchaseStoreItem {
  String id;
  List<Purchaseitem> item;
  int v;

  PurchaseStoreItem({
    required this.id,
    required this.item,
    required this.v,
  });

  factory PurchaseStoreItem.fromJson(Map<String, dynamic> json) =>
      PurchaseStoreItem(
        id: json["_id"],
        item: List<Purchaseitem>.from(
            json["item"].map((x) => Purchaseitem.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
        "__v": v,
      };
}

class Purchaseitem {
  String name;
  String brand;
  int quantity;
  int gst;
  double price;
  String id;
  dynamic manage;

  Purchaseitem({
    required this.name,
    required this.brand,
    required this.quantity,
    required this.gst,
    required this.price,
    required this.id,
  });

  factory Purchaseitem.fromJson(Map<String, dynamic> json) => Purchaseitem(
        name: json["name"],
        brand: json["brand"],
        quantity: json["quantity"],
        gst: json["gst"],
        price: json["price"]?.toDouble(),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "brand": brand,
        "quantity": quantity,
        "gst": gst,
        "price": price,
        "_id": id,
      };
  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      // DataGridCell(columnName: 'id', value: id),
      DataGridCell(columnName: 'Name', value: name),
      DataGridCell(columnName: 'brand', value: brand),
      DataGridCell(columnName: 'quantity', value: quantity),
      DataGridCell(columnName: 'gst', value: gst),
      DataGridCell(columnName: 'price', value: price),
      DataGridCell(columnName: 'Manage', value: manage),
    ]);
  }
}

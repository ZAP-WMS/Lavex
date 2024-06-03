// To parse this JSON data, do
//
//     final MyClientModel = MyClientModelFromJson(jsonString);

import 'dart:convert';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<MyClientModel> MyClientModelFromJson(String str) =>
    List<MyClientModel>.from(
        json.decode(str).map((x) => MyClientModel.fromJson(x)));

String MyClientModelToJson(List<MyClientModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyClientModel {
  String clientName;
  String clientBulstat;
  String shortcode;
  String clientContactNo;
  String clientArea;
  String clientLocation;
  dynamic manage;

  MyClientModel({
    required this.clientName,
    required this.clientBulstat,
    required this.shortcode,
    required this.clientContactNo,
    required this.clientArea,
    required this.clientLocation,
  });

  factory MyClientModel.fromJson(Map<String, dynamic> json) =>
      MyClientModel(
        clientName: json["client_name"],
        clientBulstat: json["client_bulstat"],
        shortcode: json["shortcode"],
        clientContactNo: json["client_contact_no"],
        clientArea: json["client_area"],
        clientLocation: json["client_location"],
      );

  Map<String, dynamic> toJson() => {
        "client_name": clientName,
        "client_bulstat": clientBulstat,
        "shortcode": shortcode,
        "client_contact_no": clientContactNo,
        "client_area": clientArea,
        "client_location": clientLocation,
      };

  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell(columnName: 'Name', value: clientName),
      DataGridCell(columnName: 'ShortCode', value: clientBulstat),
      DataGridCell(columnName: 'Client ShortCode', value: shortcode),
      DataGridCell(columnName: 'Mobile Number', value: clientContactNo),
      DataGridCell(columnName: 'Area', value: clientArea),
      DataGridCell(columnName: 'Location', value: clientLocation),
      DataGridCell(columnName: 'Manage', value: manage),
    ]);
  }
}

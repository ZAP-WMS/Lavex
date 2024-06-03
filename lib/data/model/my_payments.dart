// To parse this JSON data, do
//
//     final myPaymentsModel = myPaymentsModelFromJson(jsonString);

import 'dart:convert';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<MyPaymentsModel> myPaymentsModelFromJson(String str) =>
    List<MyPaymentsModel>.from(
        json.decode(str).map((x) => MyPaymentsModel.fromJson(x)));

String myPaymentsModelToJson(List<MyPaymentsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyPaymentsModel {
  String invPaymentNumber;
  String invNumber;
  String dateCreate;
  String clientName;
  String invAmount;
  String paymentAmount;
  String paymentMethod;
  String paymentCheque;
  String paymentChqDate;
  dynamic options;

  MyPaymentsModel({
    required this.invPaymentNumber,
    required this.invNumber,
    required this.dateCreate,
    required this.clientName,
    required this.invAmount,
    required this.paymentAmount,
    required this.paymentMethod,
    required this.paymentCheque,
    required this.paymentChqDate,
  });

  factory MyPaymentsModel.fromJson(Map<String, dynamic> json) =>
      MyPaymentsModel(
        invPaymentNumber: json["inv_payment_number"],
        invNumber: json["inv_number"],
        dateCreate: json["date_create"],
        clientName: json["client_name"],
        invAmount: json["inv_amount"],
        paymentAmount: json["payment_amount"],
        paymentMethod: json["payment_method"],
        paymentCheque: json["payment_cheque"],
        paymentChqDate: json["payment_chq_date"],
      );

  Map<String, dynamic> toJson() => {
        "inv_payment_number": invPaymentNumber,
        "inv_number": invNumber,
        "date_create": dateCreate,
        "client_name": clientName,
        "inv_amount": invAmount,
        "payment_amount": paymentAmount,
        "payment_method": paymentMethod,
        "payment_cheque": paymentCheque,
        "payment_chq_date": paymentChqDate,
      };

  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell(columnName: 'inv_payment_number', value: invPaymentNumber),
      DataGridCell(columnName: 'inv_number', value: invNumber),
      DataGridCell(columnName: 'date_create', value: dateCreate),
      DataGridCell(columnName: 'client_name', value: clientName),
      DataGridCell(columnName: 'inv_amount', value: invAmount),
      DataGridCell(columnName: 'payment_amount', value: paymentAmount),
      DataGridCell(columnName: 'payment_method', value: paymentMethod),
      DataGridCell(columnName: 'payment_cheque', value: paymentCheque),
      DataGridCell(columnName: 'payment_chq_date', value: paymentChqDate),
      DataGridCell(columnName: 'Options', value: options),
    ]);
  }
}

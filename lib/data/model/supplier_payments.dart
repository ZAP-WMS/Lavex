// To parse this JSON data, do
//
//     final SupplierPaymentsModel = SupplierPaymentsModelFromJson(jsonString);

import 'dart:convert';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<SupplierPaymentsModel> supplierPaymentsModelFromJson(String str) =>
    List<SupplierPaymentsModel>.from(
        json.decode(str).map((x) => SupplierPaymentsModel.fromJson(x)));

String supplierPaymentsModelToJson(List<SupplierPaymentsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SupplierPaymentsModel {
  String invPaymentNumber;
  String invNumber;
  String dateCreate;
  String supplierName;
  String invAmount;
  String paymentAmount;
  String paymentMethod;
  String paymentCheque;
  String paymentChqDate;
  dynamic options;

  SupplierPaymentsModel({
    required this.invPaymentNumber,
    required this.invNumber,
    required this.dateCreate,
    required this.supplierName,
    required this.invAmount,
    required this.paymentAmount,
    required this.paymentMethod,
    required this.paymentCheque,
    required this.paymentChqDate,
  });

  factory SupplierPaymentsModel.fromJson(Map<String, dynamic> json) =>
      SupplierPaymentsModel(
        invPaymentNumber: json["inv_payment_number"],
        invNumber: json["inv_number"],
        dateCreate: json["date_create"],
        supplierName: json["supplier_name"],
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
        "supplier_name": supplierName,
        "inv_amount": invAmount,
        "payment_amount": paymentAmount,
        "payment_method": paymentMethod,
        "payment_cheque": paymentCheque,
        "payment_chq_date": paymentChqDate,
      };

  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell(columnName: 'Movement Number', value: invPaymentNumber),
      DataGridCell(columnName: 'Number', value: invNumber),
      DataGridCell(columnName: 'Date', value: dateCreate),
      DataGridCell(columnName: 'Supplier Name', value: supplierName),
      DataGridCell(columnName: 'Invoice Amount', value: invAmount),
      DataGridCell(columnName: 'Payment Amount', value: paymentAmount),
      DataGridCell(columnName: 'Payment Method', value: paymentMethod),
      DataGridCell(columnName: 'Payment Cheque', value: paymentCheque),
      DataGridCell(columnName: 'Cheque Date', value: paymentChqDate),
      DataGridCell(columnName: 'Options', value: options),
    ]);
  }
}

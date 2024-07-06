// To parse this JSON data, do
//
//     final createInvoiceModel = createInvoiceModelFromJson(jsonString);

import 'dart:convert';

CreateInvoiceModel createInvoiceModelFromJson(String str) =>
    CreateInvoiceModel.fromJson(json.decode(str));

String createInvoiceModelToJson(CreateInvoiceModel data) =>
    json.encode(data.toJson());

class CreateInvoiceModel {
  String? message;
  bool? success;
  InvoiceData invoiceData;

  CreateInvoiceModel({
    this.message,
    this.success,
    required this.invoiceData,
  });

  factory CreateInvoiceModel.fromJson(Map<String, dynamic> json) =>
      CreateInvoiceModel(
        message: json["message"],
        success: json["success"],
        invoiceData: InvoiceData.fromJson(json["InvoiceData"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "InvoiceData": invoiceData.toJson(),
      };
}

class InvoiceData {
  InvoiceclientDetail invoiceclientDetail;
  InvoiceDetail invoiceDetail;
  InvoiceShippedDetail invoiceShippedDetail;
  bool individual;
  bool gstRegistration;
  String gstNumber;
  String selectCurrency;
  String chanlanType;
  List<InvoiceItem> invoiceItem;

  InvoiceData({
    required this.invoiceclientDetail,
    required this.invoiceDetail,
    required this.invoiceShippedDetail,
    required this.individual,
    required this.gstRegistration,
    required this.gstNumber,
    required this.selectCurrency,
    required this.chanlanType,
    required this.invoiceItem,
  });

  factory InvoiceData.fromJson(Map<String, dynamic> json) => InvoiceData(
        invoiceclientDetail:
            InvoiceclientDetail.fromJson(json["InvoiceclientDetail"]),
        invoiceDetail: InvoiceDetail.fromJson(json["invoiceDetail"]),
        invoiceShippedDetail:
            InvoiceShippedDetail.fromJson(json["InvoiceShippedDetail"]),
        individual: json["individual"],
        gstRegistration: json["gstRegistration"],
        gstNumber: json["gstNumber"],
        selectCurrency: json["selectCurrency"],
        chanlanType: json["chanlanType"],
        invoiceItem: List<InvoiceItem>.from(
            json["InvoiceItem"].map((x) => InvoiceItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "InvoiceclientDetail": invoiceclientDetail.toJson(),
        "invoiceDetail": invoiceDetail.toJson(),
        "InvoiceShippedDetail": invoiceShippedDetail.toJson(),
        "individual": individual,
        "gstRegistration": gstRegistration,
        "gstNumber": gstNumber,
        "selectCurrency": selectCurrency,
        "chanlanType": chanlanType,
        "InvoiceItem": List<dynamic>.from(invoiceItem.map((x) => x.toJson())),
      };
}

class InvoiceDetail {
  int invoiceNo;
  String invoiceDate;
  String dueDate;
  String maturityDate;
  int poNo;
  bool cashAccounting;

  InvoiceDetail({
    required this.invoiceNo,
    required this.invoiceDate,
    required this.dueDate,
    required this.maturityDate,
    required this.poNo,
    required this.cashAccounting,
  });

  factory InvoiceDetail.fromJson(Map<String, dynamic> json) => InvoiceDetail(
        invoiceNo: json["invoiceNo"],
        invoiceDate: json["invoiceDate"],
        dueDate: json["dueDate"],
        maturityDate: json["maturityDate"],
        poNo: json["poNo"],
        cashAccounting: json["cashAccounting"],
      );

  Map<String, dynamic> toJson() => {
        "invoiceNo": invoiceNo,
        "invoiceDate": invoiceDate,
        "dueDate": dueDate,
        "maturityDate": maturityDate,
        "poNo": poNo,
        "cashAccounting": cashAccounting,
      };
}

class InvoiceItem {
  String name;
  String brand;
  int quantity;
  double price;
  int gst;

  InvoiceItem({
    required this.name,
    required this.brand,
    required this.quantity,
    required this.price,
    required this.gst,
  });

  factory InvoiceItem.fromJson(Map<String, dynamic> json) => InvoiceItem(
        name: json["name"],
        brand: json["brand"],
        quantity: json["quantity"],
        price: json["price"]?.toDouble(),
        gst: json["gst"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "brand": brand,
        "quantity": quantity,
        "price": price,
        "gst": gst,
      };
}

class InvoiceShippedDetail {
  String toShipped;
  String forToShipped;

  InvoiceShippedDetail({
    required this.toShipped,
    required this.forToShipped,
  });

  factory InvoiceShippedDetail.fromJson(Map<String, dynamic> json) =>
      InvoiceShippedDetail(
        toShipped: json["toShipped"],
        forToShipped: json["forToShipped"],
      );

  Map<String, dynamic> toJson() => {
        "toShipped": toShipped,
        "forToShipped": forToShipped,
      };
}

class InvoiceclientDetail {
  String client;
  String address;
  String city;
  String country;
  String stateCode;

  InvoiceclientDetail({
    required this.client,
    required this.address,
    required this.city,
    required this.country,
    required this.stateCode,
  });

  factory InvoiceclientDetail.fromJson(Map<String, dynamic> json) =>
      InvoiceclientDetail(
        client: json["client"],
        address: json["address"],
        city: json["city"],
        country: json["country"],
        stateCode: json["stateCode"],
      );

  Map<String, dynamic> toJson() => {
        "client": client,
        "address": address,
        "city": city,
        "country": country,
        "stateCode": stateCode,
      };
}

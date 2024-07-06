// To parse this JSON data, do
//
//     final proformaInvoiceModel = proformaInvoiceModelFromJson(jsonString);

import 'dart:convert';

ProformaInvoiceModel proformaInvoiceModelFromJson(String str) =>
    ProformaInvoiceModel.fromJson(json.decode(str));

String proformaInvoiceModelToJson(ProformaInvoiceModel data) =>
    json.encode(data.toJson());

class ProformaInvoiceModel {
  String? message;
  bool? success;
  ProformaData? data;

  ProformaInvoiceModel({
    this.message,
    this.success,
    this.data,
  });

  factory ProformaInvoiceModel.fromJson(Map<String, dynamic> json) =>
      ProformaInvoiceModel(
        message: json["message"],
        success: json["success"],
        data: ProformaData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": data!.toJson(),
      };
}

class ProformaData {
  ClientDetail clientDetail;
  PorfarmaDetail porfarmaDetail;

  ShippedDetail shippedDetail;
  bool individual;
  bool gstRegistration;
  String gstNumber;
  String selectCurrency;
  List<ProformaItem> item;

  ProformaData({
    required this.clientDetail,
    required this.porfarmaDetail,
    required this.shippedDetail,
    required this.individual,
    required this.gstRegistration,
    required this.gstNumber,
    required this.selectCurrency,
    required this.item,
  });

  factory ProformaData.fromJson(Map<String, dynamic> json) => ProformaData(
        clientDetail: ClientDetail.fromJson(json["clientDetail"]),
        porfarmaDetail: PorfarmaDetail.fromJson(json["porfarmaDetail"]),
        shippedDetail: ShippedDetail.fromJson(json["shippedDetail"]),
        individual: json["individual"],
        gstRegistration: json["gstRegistration"],
        gstNumber: json["gstNumber"],
        selectCurrency: json["selectCurrency"],
        item: List<ProformaItem>.from(
            json["item"].map((x) => ProformaItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "clientDetail": clientDetail.toJson(),
        "porfarmaDetail": porfarmaDetail.toJson(),
        "shippedDetail": shippedDetail.toJson(),
        "individual": individual,
        "gstRegistration": gstRegistration,
        "gstNumber": gstNumber,
        "selectCurrency": selectCurrency,
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
      };
}

class ClientDetail {
  String client;
  String address;
  String city;
  String country;
  String stateCode;

  ClientDetail({
    required this.client,
    required this.address,
    required this.city,
    required this.country,
    required this.stateCode,
  });

  factory ClientDetail.fromJson(Map<String, dynamic> json) => ClientDetail(
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

class ProformaItem {
  String name;
  String brand;
  int quantity;
  double price;
  int gst;

  ProformaItem({
    required this.name,
    required this.brand,
    required this.quantity,
    required this.price,
    required this.gst,
  });

  factory ProformaItem.fromJson(Map<String, dynamic> json) => ProformaItem(
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

class PorfarmaDetail {
  int porfarmaNo;
  String invoiceDate;
  String dueDate;
  String maturityDate;
  String poNo;
  bool cashAccounting;

  PorfarmaDetail({
    required this.porfarmaNo,
    required this.invoiceDate,
    required this.dueDate,
    required this.maturityDate,
    required this.poNo,
    required this.cashAccounting,
  });

  factory PorfarmaDetail.fromJson(Map<String, dynamic> json) => PorfarmaDetail(
        porfarmaNo: json["porfarmaNo"],
        invoiceDate: json["invoiceDate"],
        dueDate: json["dueDate"],
        maturityDate: json["maturityDate"],
        poNo: json["poNo"],
        cashAccounting: json["cashAccounting"],
      );

  Map<String, dynamic> toJson() => {
        "porfarmaNo": porfarmaNo,
        "invoiceDate": invoiceDate,
        "dueDate": dueDate,
        "maturityDate": maturityDate,
        "poNo": poNo,
        "cashAccounting": cashAccounting,
      };
}

class ShippedDetail {
  String toShipped;
  String forToShipped;

  ShippedDetail({
    required this.toShipped,
    required this.forToShipped,
  });

  factory ShippedDetail.fromJson(Map<String, dynamic> json) => ShippedDetail(
        toShipped: json["toShipped"],
        forToShipped: json["forToShipped"],
      );

  Map<String, dynamic> toJson() => {
        "toShipped": toShipped,
        "forToShipped": forToShipped,
      };
}

// To parse this JSON data, do
//
//     final createInvoiceModel = createInvoiceModelFromJson(jsonString);

import 'dart:convert';

CreateInvoiceModel createInvoiceModelFromJson(String str) =>
    CreateInvoiceModel.fromJson(json.decode(str));

String createInvoiceModelToJson(CreateInvoiceModel data) =>
    json.encode(data.toJson());

class CreateInvoiceModel {
  String message;
  bool success;
  Data data;

  CreateInvoiceModel({
    required this.message,
    required this.success,
    required this.data,
  });

  factory CreateInvoiceModel.fromJson(Map<String, dynamic> json) =>
      CreateInvoiceModel(
        message: json["message"],
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  ClientDetail clientDetail;
  InvoiceDetail invoiceDetail;
  ShippedDetail shippedDetail;
  String selectCountry;
  String chanlanType;
  List<Item> item;

  Data({
    required this.clientDetail,
    required this.invoiceDetail,
    required this.shippedDetail,
    required this.selectCountry,
    required this.chanlanType,
    required this.item,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        clientDetail: ClientDetail.fromJson(json["clientDetail"]),
        invoiceDetail: InvoiceDetail.fromJson(json["invoiceDetail"]),
        shippedDetail: ShippedDetail.fromJson(json["shippedDetail"]),
        selectCountry: json["selectCountry"],
        chanlanType: json["chanlanType"],
        item: List<Item>.from(json["item"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "clientDetail": clientDetail.toJson(),
        "invoiceDetail": invoiceDetail.toJson(),
        "shippedDetail": shippedDetail.toJson(),
        "selectCountry": selectCountry,
        "chanlanType": chanlanType,
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

class Item {
  String name;
  String brand;
  int quantity;
  double price;
  int gst;

  Item({
    required this.name,
    required this.brand,
    required this.quantity,
    required this.price,
    required this.gst,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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

// To parse this JSON data, do
//
//     final debitNoteModel = debitNoteModelFromJson(jsonString);

import 'dart:convert';

DebitNoteModel debitNoteModelFromJson(String str) =>
    DebitNoteModel.fromJson(json.decode(str));

String debitNoteModelToJson(DebitNoteModel data) => json.encode(data.toJson());

class DebitNoteModel {
  String? message;
  bool? success;
  DebitNoteData? debitNoteData;

  DebitNoteModel({
    this.message,
    this.success,
    this.debitNoteData,
  });

  factory DebitNoteModel.fromJson(Map<String, dynamic> json) => DebitNoteModel(
        message: json["message"],
        success: json["success"],
        debitNoteData: DebitNoteData.fromJson(json["DebitNoteData"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "DebitNoteData": debitNoteData!.toJson(),
      };
}

class DebitNoteData {
  SuplierDetail suplierDetail;
  DebitNoteDetail debitNoteDetail;
  bool individual;
  bool gstRegistration;
  String gstNumber;
  String selectCurrency;
  List<DebitNoteItem> debitNoteItem;

  DebitNoteData({
    required this.suplierDetail,
    required this.debitNoteDetail,
    required this.individual,
    required this.gstRegistration,
    required this.gstNumber,
    required this.selectCurrency,
    required this.debitNoteItem,
  });

  factory DebitNoteData.fromJson(Map<String, dynamic> json) => DebitNoteData(
        suplierDetail: SuplierDetail.fromJson(json["suplierDetail"]),
        debitNoteDetail: DebitNoteDetail.fromJson(json["debitNoteDetail"]),
        individual: json["individual"],
        gstRegistration: json["gstRegistration"],
        gstNumber: json["gstNumber"],
        selectCurrency: json["selectCurrency"],
        debitNoteItem: List<DebitNoteItem>.from(
            json["DebitNoteItem"].map((x) => DebitNoteItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "suplierDetail": suplierDetail.toJson(),
        "debitNoteDetail": debitNoteDetail.toJson(),
        "individual": individual,
        "gstRegistration": gstRegistration,
        "gstNumber": gstNumber,
        "selectCurrency": selectCurrency,
        "DebitNoteItem":
            List<dynamic>.from(debitNoteItem.map((x) => x.toJson())),
      };
}

class DebitNoteDetail {
  int debitNoteNo;
  int toInvoiceNumber;
  String fromDate;
  String invoiceDate;
  String dueDate;
  String maturityDate;
  int poNo;
  bool cashAccounting;

  DebitNoteDetail({
    required this.debitNoteNo,
    required this.toInvoiceNumber,
    required this.fromDate,
    required this.invoiceDate,
    required this.dueDate,
    required this.maturityDate,
    required this.poNo,
    required this.cashAccounting,
  });

  factory DebitNoteDetail.fromJson(Map<String, dynamic> json) =>
      DebitNoteDetail(
        debitNoteNo: json["debitNoteNo"],
        toInvoiceNumber: json["toInvoiceNumber"],
        fromDate: json["fromDate"],
        invoiceDate: json["invoiceDate"],
        dueDate: json["dueDate"],
        maturityDate: json["maturityDate"],
        poNo: json["poNo"],
        cashAccounting: json["cashAccounting"],
      );

  Map<String, dynamic> toJson() => {
        "debitNoteNo": debitNoteNo,
        "toInvoiceNumber": toInvoiceNumber,
        "fromDate": fromDate,
        "invoiceDate": invoiceDate,
        "dueDate": dueDate,
        "maturityDate": maturityDate,
        "poNo": poNo,
        "cashAccounting": cashAccounting,
      };
}

class DebitNoteItem {
  String name;
  String brand;
  int quantity;
  double price;
  int gst;

  DebitNoteItem({
    required this.name,
    required this.brand,
    required this.quantity,
    required this.price,
    required this.gst,
  });

  factory DebitNoteItem.fromJson(Map<String, dynamic> json) => DebitNoteItem(
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

class SuplierDetail {
  String suplier;
  String address;
  String city;
  String country;
  String stateCode;

  SuplierDetail({
    required this.suplier,
    required this.address,
    required this.city,
    required this.country,
    required this.stateCode,
  });

  factory SuplierDetail.fromJson(Map<String, dynamic> json) => SuplierDetail(
        suplier: json["suplier"],
        address: json["address"],
        city: json["city"],
        country: json["country"],
        stateCode: json["stateCode"],
      );

  Map<String, dynamic> toJson() => {
        "suplier": suplier,
        "address": address,
        "city": city,
        "country": country,
        "stateCode": stateCode,
      };
}

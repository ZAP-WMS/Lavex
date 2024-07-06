// To parse this JSON data, do
//
//     final creditNoteModel = creditNoteModelFromJson(jsonString);

import 'dart:convert';

CreditNoteModel creditNoteModelFromJson(String str) =>
    CreditNoteModel.fromJson(json.decode(str));

String creditNoteModelToJson(CreditNoteModel data) =>
    json.encode(data.toJson());

class CreditNoteModel {
  String? message;
  bool? success;
  CreditData? creditData;

  CreditNoteModel({
    this.message,
    this.success,
    this.creditData,
  });

  factory CreditNoteModel.fromJson(Map<String, dynamic> json) =>
      CreditNoteModel(
        message: json["message"],
        success: json["success"],
        creditData: CreditData.fromJson(json["CreditData"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "CreditData": creditData!.toJson(),
      };
}

class CreditData {
  CreditclientDetail creditclientDetail;
  CreditNoteDetail creditNoteDetail;
  bool individual;
  bool gstRegistration;
  String gstNumber;
  String selectCurrency;
  List<CreditItem> creditItem;

  CreditData({
    required this.creditclientDetail,
    required this.creditNoteDetail,
    required this.individual,
    required this.gstRegistration,
    required this.gstNumber,
    required this.selectCurrency,
    required this.creditItem,
  });

  factory CreditData.fromJson(Map<String, dynamic> json) => CreditData(
        creditclientDetail:
            CreditclientDetail.fromJson(json["CreditclientDetail"]),
        creditNoteDetail: CreditNoteDetail.fromJson(json["creditNoteDetail"]),
        individual: json["individual"],
        gstRegistration: json["gstRegistration"],
        gstNumber: json["gstNumber"],
        selectCurrency: json["selectCurrency"],
        creditItem: List<CreditItem>.from(
            json["CreditItem"].map((x) => CreditItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "CreditclientDetail": creditclientDetail.toJson(),
        "creditNoteDetail": creditNoteDetail.toJson(),
        "individual": individual,
        "gstRegistration": gstRegistration,
        "gstNumber": gstNumber,
        "selectCurrency": selectCurrency,
        "CreditItem": List<dynamic>.from(creditItem.map((x) => x.toJson())),
      };
}

class CreditItem {
  String name;
  String brand;
  int quantity;
  double price;
  int gst;

  CreditItem({
    required this.name,
    required this.brand,
    required this.quantity,
    required this.price,
    required this.gst,
  });

  factory CreditItem.fromJson(Map<String, dynamic> json) => CreditItem(
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

class CreditNoteDetail {
  int creditNoteNo;
  int toInvoiceNumber;
  String fromDate;
  String invoiceDate;
  String dueDate;
  String maturityDate;
  int poNo;
  bool cashAccounting;

  CreditNoteDetail({
    required this.creditNoteNo,
    required this.toInvoiceNumber,
    required this.fromDate,
    required this.invoiceDate,
    required this.dueDate,
    required this.maturityDate,
    required this.poNo,
    required this.cashAccounting,
  });

  factory CreditNoteDetail.fromJson(Map<String, dynamic> json) =>
      CreditNoteDetail(
        creditNoteNo: json["creditNoteNo"],
        toInvoiceNumber: json["toInvoiceNumber"],
        fromDate: json["fromDate"],
        invoiceDate: json["invoiceDate"],
        dueDate: json["dueDate"],
        maturityDate: json["maturityDate"],
        poNo: json["poNo"],
        cashAccounting: json["cashAccounting"],
      );

  Map<String, dynamic> toJson() => {
        "creditNoteNo": creditNoteNo,
        "toInvoiceNumber": toInvoiceNumber,
        "fromDate": fromDate,
        "invoiceDate": invoiceDate,
        "dueDate": dueDate,
        "maturityDate": maturityDate,
        "poNo": poNo,
        "cashAccounting": cashAccounting,
      };
}

class CreditclientDetail {
  String client;
  String address;
  String city;
  String country;
  String stateCode;

  CreditclientDetail({
    required this.client,
    required this.address,
    required this.city,
    required this.country,
    required this.stateCode,
  });

  factory CreditclientDetail.fromJson(Map<String, dynamic> json) =>
      CreditclientDetail(
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

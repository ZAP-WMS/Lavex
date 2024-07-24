// To parse this JSON data, do
//
//     final addItemModel = addItemModelFromJson(jsonString);

import 'dart:convert';

List<AddItemModel> addItemModelFromJson(String str) => List<AddItemModel>.from(
    json.decode(str).map((x) => AddItemModel.fromJson(x)));

String addItemModelToJson(List<AddItemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddItemModel {
  int forUser;
  int forCompany;
  String name;
  String manufacturerName;
  String itemCode;
  int quantity;
  String quantityType;
  int lowQuantity;
  int singlePrice;
  String currency;
  int gstRate;
  String hsnCode;
  String stockStatus;
  int storeId;
  String brandName;
  String category;
  String storeName;
  int total;
  int qtySingleP;
  String qtyTypeSingleP;
  String status;

  AddItemModel({
    required this.forUser,
    required this.forCompany,
    required this.name,
    required this.manufacturerName,
    required this.itemCode,
    required this.quantity,
    required this.quantityType,
    required this.lowQuantity,
    required this.singlePrice,
    required this.currency,
    required this.gstRate,
    required this.hsnCode,
    required this.stockStatus,
    required this.storeId,
    required this.brandName,
    required this.category,
    required this.storeName,
    required this.total,
    required this.qtySingleP,
    required this.qtyTypeSingleP,
    required this.status,
  });

  factory AddItemModel.fromJson(Map<String, dynamic> json) => AddItemModel(
        forUser: json["for_user"],
        forCompany: json["for_company"],
        name: json["name"],
        manufacturerName: json["manufacturer_name"],
        itemCode: json["item_code"],
        quantity: json["quantity"],
        quantityType: json["quantity_type"],
        lowQuantity: json["low_quantity"],
        singlePrice: json["single_price"],
        currency: json["currency"],
        gstRate: json["gst_rate"],
        hsnCode: json["hsn_code"],
        stockStatus: json["stock_status"],
        storeId: json["store_id"],
        brandName: json["brand_name"],
        category: json["category"],
        storeName: json["store_name"],
        total: json["total"],
        qtySingleP: json["qty_single_p"],
        qtyTypeSingleP: json["qty_type_single_p"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        // "for_user": forUser,
        // "for_company": forCompany,
        "name": name,
        // "manufacturer_name": manufacturerName,
        // "item_code": itemCode,
        "qty": quantity,
        "qtyType": quantityType,
        "low_quantity": lowQuantity,
        "price": singlePrice,
        // "currency": currency,
        "gst": gstRate,
        "hsnCode": hsnCode,
        "stockStatus": stockStatus,
        // "store_id": storeId,
        "brand": brandName,
        "category": category,
        "store": storeName,
        // "total": total,
        //  "qty_single_p": qtySingleP,
        "qtyType2": qtyTypeSingleP,
        // "status": status,
      };
}

import 'dart:convert';

BomitemModel bomitemModelFromJson(String str) =>
    BomitemModel.fromJson(json.decode(str));

String bomitemModelToJson(BomitemModel data) => json.encode(data.toJson());

class BomitemModel {
  String status;
  ReadyStock readyStock;
  List<ReadyStock> raw;

  BomitemModel({
    required this.status,
    required this.readyStock,
    required this.raw,
  });

  factory BomitemModel.fromJson(Map<String, dynamic> json) => BomitemModel(
        status: json["status"],
        readyStock: ReadyStock.fromJson(json["readyStock"]),
        raw: List<ReadyStock>.from(
            json["raw"].map((x) => ReadyStock.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "readyStock": readyStock.toJson(),
        "raw": List<dynamic>.from(raw.map((x) => x.toJson())),
      };
}

class ReadyStock {
  String name;
  int qty;
  int itemCode;
  int price;
  String qtyType;
  String store;
  String brand;
  String stockStatus;
  int gst;

  ReadyStock({
    required this.name,
    required this.qty,
    required this.itemCode,
    required this.price,
    required this.qtyType,
    required this.store,
    required this.brand,
    required this.stockStatus,
    required this.gst,
  });

  factory ReadyStock.fromJson(Map<String, dynamic> json) => ReadyStock(
        name: json["name"],
        qty: json["qty"],
        itemCode: json["itemCode"],
        price: json["price"],
        qtyType: json["qtyType"],
        store: json["store"],
        brand: json["brand"],
        stockStatus: json["stockStatus"],
        gst: json["gst"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "qty": qty,
        "itemCode": itemCode,
        "price": price,
        "qtyType": qtyType,
        "store": store,
        "brand": brand,
        "stockStatus": stockStatus,
        "gst": gst,
      };
}

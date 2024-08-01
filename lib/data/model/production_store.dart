import 'dart:convert';

ProductioStore productioStoreFromJson(String str) =>
    ProductioStore.fromJson(json.decode(str));
String productioStoreToJson(ProductioStore data) => json.encode(data.toJson());

class ProductioStore {
  String message;
  bool success;
  List<Datum> data;

  ProductioStore({
    required this.message,
    required this.success,
    required this.data,
  });

  factory ProductioStore.fromJson(Map<String, dynamic> json) => ProductioStore(
        message: json["message"],
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  List<ReadyStock> readyStock;
  int v;

  Datum({
    required this.id,
    required this.readyStock,
    required this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        readyStock: List<ReadyStock>.from(
            json["readyStock"].map((x) => ReadyStock.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "readyStock": List<dynamic>.from(readyStock.map((x) => x.toJson())),
        "__v": v,
      };
}

class ReadyStock {
  String name;
  String brand;
  int qty;
  int gst;
  double price;
  String id;

  ReadyStock({
    required this.name,
    required this.brand,
    required this.qty,
    required this.gst,
    required this.price,
    required this.id,
  });

  factory ReadyStock.fromJson(Map<String, dynamic> json) => ReadyStock(
        name: json["name"],
        brand: json["brand"],
        qty: json["qty"],
        gst: json["gst"],
        price: json["price"]?.toDouble(),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "brand": brand,
        "qty": qty,
        "gst": gst,
        "price": price,
        "_id": id,
      };
}

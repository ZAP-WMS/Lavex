import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProductionstoreModel {
  String? message;
  bool? success;
  List<ProductionstoreData>? data;

  ProductionstoreModel({this.message, this.success, this.data});

  ProductionstoreModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['data'] != null) {
      data = <ProductionstoreData>[];
      json['data'].forEach((v) {
        data!.add(new ProductionstoreData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductionstoreData {
  String? sId;
  List<ProductionstoreDataReadyStock>? readyStock;
  int? iV;

  ProductionstoreData({this.sId, this.readyStock, this.iV});

  ProductionstoreData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['readyStock'] != null) {
      readyStock = <ProductionstoreDataReadyStock>[];
      json['readyStock'].forEach((v) {
        readyStock!.add(new ProductionstoreDataReadyStock.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.readyStock != null) {
      data['readyStock'] = this.readyStock!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class ProductionstoreDataReadyStock {
  String? name;
  String? brand;
  int? qty;
  int? gst;
  double? price;
  String? sId;
  dynamic manage;

  ProductionstoreDataReadyStock(
      {this.name, this.brand, this.qty, this.gst, this.price, this.sId});

  ProductionstoreDataReadyStock.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    brand = json['brand'];
    qty = json['qty'];
    gst = json['gst'];
    price = json['price'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['brand'] = this.brand;
    data['qty'] = this.qty;
    data['gst'] = this.gst;
    data['price'] = this.price;
    data['_id'] = this.sId;
    return data;
  }

  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell(columnName: 'Name', value: name),
      DataGridCell(columnName: 'Brand', value: brand),
      DataGridCell(columnName: 'Qty', value: qty),
      DataGridCell(columnName: 'Gst', value: gst),
      DataGridCell(columnName: 'Price', value: price),
      DataGridCell(columnName: 'id', value: sId),
      DataGridCell(columnName: 'Manage', value: manage),
    ]);
  }
}

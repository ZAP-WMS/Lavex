import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class GetAllStockModel {
  String? message;
  bool? success;
  List<GetAllStockData>? data;

  GetAllStockModel({this.message, this.success, this.data});

  GetAllStockModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['data'] != null) {
      data = <GetAllStockData>[];
      json['data'].forEach((v) {
        data!.add(new GetAllStockData.fromJson(v));
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

class GetAllStockData {
  String? name;
  String? brand;
  int? quantity;
  int? gst;
  double? price;
  String? sId;
  int? qty;
  dynamic manage;

  GetAllStockData(
      {this.name,
      this.brand,
      this.quantity,
      this.gst,
      this.price,
      this.sId,
      this.qty});

  GetAllStockData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    brand = json['brand'];
    quantity = json['quantity'];
    gst = json['gst'];
    price = json['price'];
    sId = json['_id'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['brand'] = this.brand;
    data['quantity'] = this.quantity;
    data['gst'] = this.gst;
    data['price'] = this.price;
    data['_id'] = this.sId;
    data['qty'] = this.qty;
    return data;
  }

  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell(columnName: 'Name', value: name),
      DataGridCell(columnName: 'Brand', value: brand),
      DataGridCell(columnName: 'Quantity', value: quantity),
      DataGridCell(columnName: 'Gst', value: gst),
      DataGridCell(columnName: 'Price', value: price),
      DataGridCell(columnName: 'Qty', value: qty),
      DataGridCell(columnName: 'Id', value: sId),
      DataGridCell(columnName: 'Manage', value: manage),
    ]);
  }
}

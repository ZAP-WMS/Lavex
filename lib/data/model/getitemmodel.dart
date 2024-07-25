import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class getallitemmodel {
  String? message;
  bool? success;
  List<itemData>? data;

  getallitemmodel({this.message, this.success, this.data});

  getallitemmodel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['data'] != null) {
      data = <itemData>[];
      json['data'].forEach((v) {
        data!.add(new itemData.fromJson(v));
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

class itemData {
  String? sId;
  String? name;
  String? itemCode;
  int? qty;
  int? price;
  String? qtyType;
  String? store;
  String? brand;
  String? stockStatus;
  int? iV;
  dynamic manage;
  int? gst;

  itemData(
      {this.sId,
      this.name,
      this.itemCode,
      this.qty,
      this.price,
      this.qtyType,
      this.store,
      this.brand,
      this.stockStatus,
      this.iV,
      this.gst});

  itemData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    itemCode = json['itemCode'];
    qty = json['qty'];
    price = json['price'];
    qtyType = json['qtyType'];
    store = json['store'];
    brand = json['brand'];
    stockStatus = json['stockStatus'];
    iV = json['__v'];
    gst = json['gst'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['itemCode'] = this.itemCode;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['qtyType'] = this.qtyType;
    data['store'] = this.store;
    data['brand'] = this.brand;
    data['stockStatus'] = this.stockStatus;
    data['__v'] = this.iV;
    data['gst'] = this.gst;
    return data;
  }

  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell(columnName: 'Id', value: sId),
      DataGridCell(columnName: 'Name', value: name),
      DataGridCell(columnName: 'itemCode', value: itemCode),
      DataGridCell(columnName: 'qty', value: qty),
      DataGridCell(columnName: 'price', value: price),
      DataGridCell(columnName: 'qtyType', value: qtyType),
      DataGridCell(columnName: 'store', value: store),
      DataGridCell(columnName: 'stockStatus', value: stockStatus),
      DataGridCell(columnName: 'Manage', value: manage),
    ]);
  }
}

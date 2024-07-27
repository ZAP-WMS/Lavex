import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class getallitemmodel {
  String? message;
  bool? success;
  List<ItemMasterData>? data;

  getallitemmodel({this.message, this.success, this.data});

  getallitemmodel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['data'] != null) {
      data = <ItemMasterData>[];
      json['data'].forEach((v) {
        data!.add(new ItemMasterData.fromJson(v));
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

class ItemMasterData {
  String? sId;
  String? name;
  int? itemCode;
  int? hsnCode;
  int? qty;
  int? price;
  String? qtyType;
  String? qtyType2;
  int? gst;
  int? lawqty;
  String? category;
  String? store;
  String? brand;
  Null? manufacturar;
  String? stockStatus;
  dynamic manage;
  int? iV;

  ItemMasterData(
      {this.sId,
      this.name,
      this.itemCode,
      this.hsnCode,
      this.qty,
      this.price,
      this.qtyType,
      this.qtyType2,
      this.gst,
      this.lawqty,
      this.category,
      this.store,
      this.brand,
      this.manufacturar,
      this.stockStatus,
      this.iV});

  ItemMasterData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    itemCode = json['itemCode'];
    hsnCode = json['hsnCode'];
    qty = json['qty'];
    price = json['price'];
    qtyType = json['qtyType'];
    qtyType2 = json['qtyType2'];
    gst = json['gst'];
    lawqty = json['lawqty'];
    category = json['category'];
    store = json['store'];
    brand = json['brand'];
    manufacturar = json['manufacturar'];
    stockStatus = json['stockStatus'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['itemCode'] = this.itemCode;
    data['hsnCode'] = this.hsnCode;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['qtyType'] = this.qtyType;
    data['qtyType2'] = this.qtyType2;
    data['gst'] = this.gst;
    data['lawqty'] = this.lawqty;
    data['category'] = this.category;
    data['store'] = this.store;
    data['brand'] = this.brand;
    data['manufacturar'] = this.manufacturar;
    data['stockStatus'] = this.stockStatus;
    data['__v'] = this.iV;
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

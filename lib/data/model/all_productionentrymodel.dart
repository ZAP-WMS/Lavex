import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AllProductionentryModel {
  String? message;
  bool? success;
  List<AllProductionentryData>? data;

  AllProductionentryModel({this.message, this.success, this.data});

  AllProductionentryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['data'] != null) {
      data = <AllProductionentryData>[];
      json['data'].forEach((v) {
        data!.add(new AllProductionentryData.fromJson(v));
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

class AllProductionentryData {
  String? sId;
  String? status;
  int? prodNum;
  String? dateCreated;
  String? remark;
  String? accepted;
  List<Raw>? raw;
  List<ReadyStock>? readyStock;
  int? iV;
  dynamic manage;

  AllProductionentryData(
      {this.sId,
      this.status,
      this.prodNum,
      this.dateCreated,
      this.remark,
      this.accepted,
      this.raw,
      this.readyStock,
      this.iV});

  AllProductionentryData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    prodNum = json['prodNum'];
    dateCreated = json['dateCreated'];
    remark = json['remark'];
    accepted = json['accepted'];
    if (json['raw'] != null) {
      raw = <Raw>[];
      json['raw'].forEach((v) {
        raw!.add(new Raw.fromJson(v));
      });
    }
    if (json['readyStock'] != null) {
      readyStock = <ReadyStock>[];
      json['readyStock'].forEach((v) {
        readyStock!.add(new ReadyStock.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['status'] = this.status;
    data['prodNum'] = this.prodNum;
    data['dateCreated'] = this.dateCreated;
    data['remark'] = this.remark;
    data['accepted'] = this.accepted;
    if (this.raw != null) {
      data['raw'] = this.raw!.map((v) => v.toJson()).toList();
    }
    if (this.readyStock != null) {
      data['readyStock'] = this.readyStock!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }

  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell(columnName: 'ProdNum', value: prodNum),
      DataGridCell(columnName: 'DateCreated', value: dateCreated),
      DataGridCell(columnName: 'Remark', value: remark),
      DataGridCell(columnName: 'Status', value: status),
      DataGridCell(columnName: 'Accepted', value: accepted),
      DataGridCell(columnName: 'id', value: sId),
      DataGridCell(columnName: 'Manage', value: manage),
    ]);
  }
}

class Raw {
  String? name;
  String? brand;
  int? quantity;
  int? gst;
  int? price;
  String? sId;

  Raw({this.name, this.brand, this.quantity, this.gst, this.price, this.sId});

  Raw.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    brand = json['brand'];
    quantity = json['quantity'];
    gst = json['gst'];
    price = json['price'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['brand'] = this.brand;
    data['quantity'] = this.quantity;
    data['gst'] = this.gst;
    data['price'] = this.price;
    data['_id'] = this.sId;
    return data;
  }
}

class ReadyStock {
  String? name;
  String? brand;
  int? qty;
  int? gst;
  double? price;
  String? sId;

  ReadyStock({this.name, this.brand, this.qty, this.gst, this.price, this.sId});

  ReadyStock.fromJson(Map<String, dynamic> json) {
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
}

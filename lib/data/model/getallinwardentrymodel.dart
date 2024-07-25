import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class getallInwardEntryModel {
  String? message;
  bool? success;
  List<Data>? data;

  getallInwardEntryModel({this.message, this.success, this.data});

  getallInwardEntryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? sId;
  String? paymentType;
  String? status;
  String? forUnit;
  String? suplierName;
  String? shortCode;
  bool? gstRegistration;
  String? gstNumber;
  bool? individual;
  String? accountPerson;
  String? city;
  String? address;
  String? country;
  int? movementNumber;
  String? remark;
  String? accepted;
  String? dateCreated;
  String? suplierInvoiceNo;
  List<Item>? item;
  int? iV;
  dynamic manage;

  Data(
      {this.sId,
      this.paymentType,
      this.status,
      this.forUnit,
      this.suplierName,
      this.shortCode,
      this.gstRegistration,
      this.gstNumber,
      this.individual,
      this.accountPerson,
      this.city,
      this.address,
      this.country,
      this.movementNumber,
      this.remark,
      this.accepted,
      this.dateCreated,
      this.suplierInvoiceNo,
      this.item,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    paymentType = json['paymentType'];
    status = json['status'];
    forUnit = json['forUnit'];
    suplierName = json['suplierName'];
    shortCode = json['shortCode'];
    gstRegistration = json['gstRegistration'];
    gstNumber = json['gstNumber'];
    individual = json['individual'];
    accountPerson = json['accountPerson'];
    city = json['city'];
    address = json['address'];
    country = json['country'];
    movementNumber = json['movementNumber'];
    remark = json['remark'];
    accepted = json['accepted'];
    dateCreated = json['dateCreated'];
    suplierInvoiceNo = json['suplierInvoiceNo'];
    if (json['item'] != null) {
      item = <Item>[];
      json['item'].forEach((v) {
        item!.add(new Item.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['paymentType'] = this.paymentType;
    data['status'] = this.status;
    data['forUnit'] = this.forUnit;
    data['suplierName'] = this.suplierName;
    data['shortCode'] = this.shortCode;
    data['gstRegistration'] = this.gstRegistration;
    data['gstNumber'] = this.gstNumber;
    data['individual'] = this.individual;
    data['accountPerson'] = this.accountPerson;
    data['city'] = this.city;
    data['address'] = this.address;
    data['country'] = this.country;
    data['movementNumber'] = this.movementNumber;
    data['remark'] = this.remark;
    data['accepted'] = this.accepted;
    data['dateCreated'] = this.dateCreated;
    data['suplierInvoiceNo'] = this.suplierInvoiceNo;
    if (this.item != null) {
      data['item'] = this.item!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }

  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell(columnName: 'suplierInvoiceNo', value: suplierInvoiceNo),
      DataGridCell(columnName: 'dateCreated', value: dateCreated),
      DataGridCell(columnName: 'remark', value: remark),
      DataGridCell(columnName: 'movementNumber', value: movementNumber),
      DataGridCell(columnName: 'country', value: country),
      DataGridCell(columnName: 'accountPerson', value: accountPerson),
      DataGridCell(columnName: 'gstRegistration', value: gstRegistration),
      DataGridCell(columnName: 'status', value: status),
      DataGridCell(columnName: 'Manage', value: ''),
    ]);
  }
}

class Item {
  String? name;
  String? brand;
  int? quantity;
  int? gst;
  double? price;
  String? sId;

  Item({this.name, this.brand, this.quantity, this.gst, this.price, this.sId});

  Item.fromJson(Map<String, dynamic> json) {
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

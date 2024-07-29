class GetAllbomModel {
  String? message;
  bool? success;
  List<Allbom>? data;

  GetAllbomModel({this.message, this.success, this.data});

  GetAllbomModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Allbom>[];
      json['data'].forEach((v) {
        data!.add(new Allbom.fromJson(v));
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

class Allbom {
  ReadyStock? readyStock;
  String? sId;
  String? status;
  List<Raw>? raw;
  int? iV;

  Allbom({this.readyStock, this.sId, this.status, this.raw, this.iV});

  Allbom.fromJson(Map<String, dynamic> json) {
    readyStock = json['readyStock'] != null
        ? new ReadyStock.fromJson(json['readyStock'])
        : null;
    sId = json['_id'];
    status = json['status'];
    if (json['raw'] != null) {
      raw = <Raw>[];
      json['raw'].forEach((v) {
        raw!.add(new Raw.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.readyStock != null) {
      data['readyStock'] = this.readyStock!.toJson();
    }
    data['_id'] = this.sId;
    data['status'] = this.status;
    if (this.raw != null) {
      data['raw'] = this.raw!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class ReadyStock {
  String? name;
  int? qty;
  String? qtyType;
  int? price;
  int? gst;
  String? brand;

  ReadyStock(
      {this.name, this.qty, this.qtyType, this.price, this.gst, this.brand});

  ReadyStock.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    qty = json['qty'];
    qtyType = json['qtyType'];
    price = json['price'];
    gst = json['gst'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['qty'] = this.qty;
    data['qtyType'] = this.qtyType;
    data['price'] = this.price;
    data['gst'] = this.gst;
    data['brand'] = this.brand;
    return data;
  }
}

class Raw {
  String? name;
  int? qty;
  String? qtyType;
  int? price;
  int? gst;
  String? brand;
  String? sId;

  Raw(
      {this.name,
      this.qty,
      this.qtyType,
      this.price,
      this.gst,
      this.brand,
      this.sId});

  Raw.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    qty = json['qty'];
    qtyType = json['qtyType'];
    price = json['price'];
    gst = json['gst'];
    brand = json['brand'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['qty'] = this.qty;
    data['qtyType'] = this.qtyType;
    data['price'] = this.price;
    data['gst'] = this.gst;
    data['brand'] = this.brand;
    data['_id'] = this.sId;
    return data;
  }
}

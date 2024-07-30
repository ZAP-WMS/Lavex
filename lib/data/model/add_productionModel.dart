class addProductionModel {
  String? accepted;
  String? remark;
  String? dateCreated;
  List<ReadyStock>? readyStock;
  List<Raw>? raw;

  addProductionModel(
      {this.accepted,
      this.remark,
      this.dateCreated,
      this.readyStock,
      this.raw});

  addProductionModel.fromJson(Map<String, dynamic> json) {
    accepted = json['accepted'];
    remark = json['remark'];
    dateCreated = json['dateCreated'];
    if (json['readyStock'] != null) {
      readyStock = <ReadyStock>[];
      json['readyStock'].forEach((v) {
        readyStock!.add(new ReadyStock.fromJson(v));
      });
    }
    if (json['raw'] != null) {
      raw = <Raw>[];
      json['raw'].forEach((v) {
        raw!.add(new Raw.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accepted'] = this.accepted;
    data['remark'] = this.remark;
    data['dateCreated'] = this.dateCreated;
    if (this.readyStock != null) {
      data['readyStock'] = this.readyStock!.map((v) => v.toJson()).toList();
    }
    if (this.raw != null) {
      data['raw'] = this.raw!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReadyStock {
  String? name;
  int? qty;
  double? price;
  int? gst;
  String? brand;

  ReadyStock({this.name, this.qty, this.price, this.gst, this.brand});

  ReadyStock.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    qty = json['qty'];
    price = json['price'];
    gst = json['gst'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['gst'] = this.gst;
    data['brand'] = this.brand;
    return data;
  }
}

class Raw {
  String? name;
  int? quantity;
  int? price;
  String? brand;
  int? gst;

  Raw({this.name, this.quantity, this.price, this.brand, this.gst});

  Raw.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    brand = json['brand'];
    gst = json['gst'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['brand'] = this.brand;
    data['gst'] = this.gst;
    return data;
  }
}

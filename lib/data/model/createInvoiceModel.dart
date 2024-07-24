class CreateInvoiceModel {
  ClientDetail? clientDetail;
  InvoiceDetail? invoiceDetail;
  String? selectCurrency;
  String? chanlanType;
  List<Item>? item;

  CreateInvoiceModel(
      {this.clientDetail,
      this.invoiceDetail,
      this.selectCurrency,
      this.chanlanType,
      this.item});

  CreateInvoiceModel.fromJson(Map<String, dynamic> json) {
    clientDetail = json['clientDetail'] != null
        ? new ClientDetail.fromJson(json['clientDetail'])
        : null;
    invoiceDetail = json['invoiceDetail'] != null
        ? new InvoiceDetail.fromJson(json['invoiceDetail'])
        : null;
    selectCurrency = json['selectCurrency'];
    chanlanType = json['chanlanType'];
    if (json['item'] != null) {
      item = <Item>[];
      json['item'].forEach((v) {
        item!.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clientDetail != null) {
      data['clientDetail'] = this.clientDetail!.toJson();
    }
    if (this.invoiceDetail != null) {
      data['invoiceDetail'] = this.invoiceDetail!.toJson();
    }
    data['selectCurrency'] = this.selectCurrency;
    data['chanlanType'] = this.chanlanType;
    if (this.item != null) {
      data['item'] = this.item!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClientDetail {
  String? client;
  String? address;
  String? city;
  String? country;
  String? stateCode;
  String? toShipped;
  String? forToShipped;

  ClientDetail(
      {this.client,
      this.address,
      this.city,
      this.country,
      this.stateCode,
      this.toShipped,
      this.forToShipped});

  ClientDetail.fromJson(Map<String, dynamic> json) {
    client = json['client'];
    address = json['address'];
    city = json['city'];
    country = json['country'];
    stateCode = json['stateCode'];
    toShipped = json['toShipped'];
    forToShipped = json['forToShipped'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client'] = this.client;
    data['address'] = this.address;
    data['city'] = this.city;
    data['country'] = this.country;
    data['stateCode'] = this.stateCode;
    data['toShipped'] = this.toShipped;
    data['forToShipped'] = this.forToShipped;
    return data;
  }
}

class InvoiceDetail {
  int? invoiceNo;
  String? invoiceDate;
  String? dueDate;
  int? poNo;
  bool? cashAccounting;

  InvoiceDetail(
      {this.invoiceNo,
      this.invoiceDate,
      this.dueDate,
      this.poNo,
      this.cashAccounting});

  InvoiceDetail.fromJson(Map<String, dynamic> json) {
    invoiceNo = json['invoiceNo'];
    invoiceDate = json['invoiceDate'];
    dueDate = json['dueDate'];
    poNo = json['poNo'];
    cashAccounting = json['cashAccounting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoiceNo'] = this.invoiceNo;
    data['invoiceDate'] = this.invoiceDate;
    data['dueDate'] = this.dueDate;
    data['poNo'] = this.poNo;
    data['cashAccounting'] = this.cashAccounting;
    return data;
  }
}

class Item {
  String? name;
  String? brand;
  int? quantity;
  double? price;
  int? gst;

  Item({this.name, this.brand, this.quantity, this.price, this.gst});

  Item.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    brand = json['brand'];
    quantity = json['quantity'];
    price = json['price'];
    gst = json['gst'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['brand'] = this.brand;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['gst'] = this.gst;
    return data;
  }
}

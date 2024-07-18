import 'cart_item.dart';

class InwardEntrymodel {
  String? paymentType;
  String? forUnit;
  String? suplierName;
  String? shortCode;
  bool? gstRegistration;
  bool? individual;
  String? accountPerson;
  String? city;
  String? address;
  String? country;
  String? dateCreated;
  String? remark;
  String? accepted;
  String? suplierInvoiceNo;
  List<CartItem>? item;

  InwardEntrymodel(
      {this.paymentType,
      this.forUnit,
      this.suplierName,
      this.shortCode,
      this.gstRegistration,
      this.individual,
      this.accountPerson,
      this.city,
      this.address,
      this.country,
      this.dateCreated,
      this.remark,
      this.accepted,
      this.suplierInvoiceNo,
      this.item});

  InwardEntrymodel.fromJson(Map<String, dynamic> json) {
    paymentType = json['paymentType'];
    forUnit = json['forUnit'];
    suplierName = json['suplierName'];
    shortCode = json['shortCode'];
    gstRegistration = json['gstRegistration'];
    individual = json['individual'];
    accountPerson = json['accountPerson'];
    city = json['city'];
    address = json['address'];
    country = json['country'];
    dateCreated = json['dateCreated'];
    remark = json['remark'];
    accepted = json['accepted'];
    suplierInvoiceNo = json['suplierInvoiceNo'];
    if (json['item'] != null) {
      item = <CartItem>[];
      json['item'].forEach((v) {
        item!.add(new CartItem.fromjson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentType'] = this.paymentType;
    data['forUnit'] = this.forUnit;
    data['suplierName'] = this.suplierName;
    data['shortCode'] = this.shortCode;
    data['gstRegistration'] = this.gstRegistration;
    data['individual'] = this.individual;
    data['accountPerson'] = this.accountPerson;
    data['city'] = this.city;
    data['address'] = this.address;
    data['country'] = this.country;
    data['dateCreated'] = this.dateCreated;
    data['remark'] = this.remark;
    data['accepted'] = this.accepted;
    data['suplierInvoiceNo'] = this.suplierInvoiceNo;
    if (this.item != null) {
      data['item'] = this.item!.map((v) => v.toJson()).toList();
    }
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

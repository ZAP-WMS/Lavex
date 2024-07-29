class updateItemMasterModel {
  String? name;
  int? qty;
  String? qtyType;
  int? price;
  int? gst;
  int? hsnCode;
  String? brand;
  String? store;
  String? stockStatus;
  String? qtyType2;
  int? lawqty;
  String? category;

  updateItemMasterModel(
      {this.name,
      this.qty,
      this.qtyType,
      this.price,
      this.gst,
      this.hsnCode,
      this.brand,
      this.store,
      this.stockStatus,
      this.qtyType2,
      this.lawqty,
      this.category});

  updateItemMasterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    qty = json['qty'];
    qtyType = json['qtyType'];
    price = json['price'];
    gst = json['gst'];
    hsnCode = json['hsnCode'];
    brand = json['brand'];
    store = json['store'];
    stockStatus = json['stockStatus'];
    qtyType2 = json['qtyType2'];
    lawqty = json['lawqty'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['qty'] = this.qty;
    data['qtyType'] = this.qtyType;
    data['price'] = this.price;
    data['gst'] = this.gst;
    data['hsnCode'] = this.hsnCode;
    data['brand'] = this.brand;
    data['store'] = this.store;
    data['stockStatus'] = this.stockStatus;
    data['qtyType2'] = this.qtyType2;
    data['lawqty'] = this.lawqty;
    data['category'] = this.category;
    return data;
  }
}

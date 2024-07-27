import 'package:lavex/data/model/getitemmodel.dart';

class bomitemModel {
  ItemMasterData? readyStock;
  List<ItemMasterData>? raw;

  bomitemModel({this.readyStock, this.raw});

  bomitemModel.fromJson(Map<String, dynamic> json) {
    readyStock = json['readyStock'] != null
        ? new ItemMasterData.fromJson(json['readyStock'])
        : null;
    if (json['raw'] != null) {
      raw = <ItemMasterData>[];
      json['raw'].forEach((v) {
        raw!.add(new ItemMasterData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.readyStock != null) {
      data['readyStock'] = this.readyStock!.toJson();
    }
    if (this.raw != null) {
      data['raw'] = this.raw!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

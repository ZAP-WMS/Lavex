import 'dart:convert';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<MyClientModel> MyClientModelFromJson(String str) =>
    List<MyClientModel>.from(
        json.decode(str).map((x) => MyClientModel.fromJson(x)));

String MyClientModelToJson(List<MyClientModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class getClient {
  String? message;
  List<MyClientModel>? data;
  bool? success;

  getClient({this.message, this.data, this.success});

  getClient.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <MyClientModel>[];
      json['data'].forEach((v) {
        data!.add(new MyClientModel.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class MyClientModel {
  String? sId;
  String? client;
  String? clientShortCode;
  String? area;
  String? email;
  String? contactNo;
  int? firstcreditLimit;
  String? frcreditLtDays;
  int? secondcreditLimit;
  String? sdCrlmDays;
  String? accPerson;
  String? state;
  String? country;
  String? shipTo;
  String? grade;
  String? gstNumber;
  String? location;
  String? pincode;
  String? mobile;
  String? panNumber;
  String? city;
  String? stateCode;
  String? beneficiary;
  int? iV;
  dynamic manage;

  MyClientModel(
      {this.sId,
      this.client,
      this.clientShortCode,
      this.area,
      this.email,
      this.contactNo,
      this.firstcreditLimit,
      this.frcreditLtDays,
      this.secondcreditLimit,
      this.sdCrlmDays,
      this.accPerson,
      this.state,
      this.country,
      this.shipTo,
      this.grade,
      this.gstNumber,
      this.location,
      this.pincode,
      this.mobile,
      this.panNumber,
      this.city,
      this.stateCode,
      this.beneficiary,
      this.iV});

  MyClientModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    client = json['client'];
    clientShortCode = json['clientShortCode'];
    area = json['area'];
    email = json['email'];
    contactNo = json['contactNo'];
    firstcreditLimit = json['firstcreditLimit'];
    frcreditLtDays = json['frcreditLtDays'];
    secondcreditLimit = json['secondcreditLimit'];
    sdCrlmDays = json['sdCrlmDays'];
    accPerson = json['accPerson'];
    state = json['state'];
    country = json['country'];
    shipTo = json['shipTo'];
    grade = json['grade'];
    gstNumber = json['gstNumber'];
    location = json['location'];
    pincode = json['pincode'];
    mobile = json['mobile'];
    panNumber = json['panNumber'];
    city = json['city'];
    stateCode = json['stateCode'];
    beneficiary = json['beneficiary'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['client'] = this.client;
    data['clientShortCode'] = this.clientShortCode;
    data['area'] = this.area;
    data['email'] = this.email;
    data['contactNo'] = this.contactNo;
    data['firstcreditLimit'] = this.firstcreditLimit;
    data['frcreditLtDays'] = this.frcreditLtDays;
    data['secondcreditLimit'] = this.secondcreditLimit;
    data['sdCrlmDays'] = this.sdCrlmDays;
    data['accPerson'] = this.accPerson;
    data['state'] = this.state;
    data['country'] = this.country;
    data['shipTo'] = this.shipTo;
    data['grade'] = this.grade;
    data['gstNumber'] = this.gstNumber;
    data['location'] = this.location;
    data['pincode'] = this.pincode;
    data['mobile'] = this.mobile;
    data['panNumber'] = this.panNumber;
    data['city'] = this.city;
    data['stateCode'] = this.stateCode;
    data['beneficiary'] = this.beneficiary;
    data['__v'] = this.iV;
    return data;
  }

  DataGridRow dataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell(columnName: 'Id', value: sId),
      DataGridCell(columnName: 'Name', value: client),
      DataGridCell(columnName: 'ShortCode', value: clientShortCode),
      DataGridCell(columnName: 'Client ShortCode', value: clientShortCode),
      DataGridCell(columnName: 'Mobile Number', value: mobile),
      DataGridCell(columnName: 'Area', value: area),
      DataGridCell(columnName: 'Location', value: location),
      DataGridCell(columnName: 'Manage', value: manage),
    ]);
  }
}

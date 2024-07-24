// To parse this JSON data, do
//
//     final addSuppllier = addSuppllierFromJson(jsonString);

import 'dart:convert';

AddSuppllier addSuppllierFromJson(String str) =>
    AddSuppllier.fromJson(json.decode(str));

String addSuppllierToJson(AddSuppllier data) => json.encode(data.toJson());

class AddSuppllier {
  String? message;
  bool? success;
  SuppllierData suppllierData;

  AddSuppllier({
    this.message,
    this.success,
    required this.suppllierData,
  });

  factory AddSuppllier.fromJson(Map<String, dynamic> json) => AddSuppllier(
        message: json["message"],
        success: json["success"],
        suppllierData: SuppllierData.fromJson(json["SuppllierData"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "SuppllierData": suppllierData.toJson(),
      };
}

class SuppllierData {
  String supplier;
  String suppShortCode;
  String area;
  String email;
  String contactNo;
  String accPerson;
  String state;
  String country;
  String address;
  String gstNumber;
  String location;
  String pincode;
  String mobile;
  String panNumber;
  String city;
  String stateCode;
  String beneficiary;

  SuppllierData({
    required this.supplier,
    required this.suppShortCode,
    required this.area,
    required this.email,
    required this.contactNo,
    required this.accPerson,
    required this.state,
    required this.country,
    required this.address,
    required this.gstNumber,
    required this.location,
    required this.pincode,
    required this.mobile,
    required this.panNumber,
    required this.city,
    required this.stateCode,
    required this.beneficiary,
  });

  factory SuppllierData.fromJson(Map<String, dynamic> json) => SuppllierData(
        supplier: json["supplier"],
        suppShortCode: json["SuppShortCode"],
        area: json["area"],
        email: json["email"],
        contactNo: json["contactNo"],
        accPerson: json["accPerson"],
        state: json["state"],
        country: json["country"],
        address: json["address"],
        gstNumber: json["gstNumber"],
        location: json["location"],
        pincode: json["pincode"],
        mobile: json["mobile"],
        panNumber: json["panNumber"],
        city: json["city"],
        stateCode: json["stateCode"],
        beneficiary: json["beneficiary"],
      );

  Map<String, dynamic> toJson() => {
        "supplier": supplier,
        "SuppShortCode": suppShortCode,
        "area": area,
        "email": email,
        "contactNo": contactNo,
        "accPerson": accPerson,
        "state": state,
        "country": country,
        "address": address,
        "gstNumber": gstNumber,
        "location": location,
        "pincode": pincode,
        "mobile": mobile,
        "panNumber": panNumber,
        "city": city,
        "stateCode": stateCode,
        "beneficiary": beneficiary,
      };
}

// To parse this JSON data, do
//
//     final addClientModel = addClientModelFromJson(jsonString);

import 'dart:convert';

AddClientModel addClientModelFromJson(String str) =>
    AddClientModel.fromJson(json.decode(str));

String addClientModelToJson(AddClientModel data) => json.encode(data.toJson());

class AddClientModel {
  String? message;
  bool? success;
  ClientData clientData;

  AddClientModel({
    this.message,
    this.success,
    required this.clientData,
  });

  factory AddClientModel.fromJson(Map<String, dynamic> json) => AddClientModel(
        message: json["message"],
        success: json["success"],
        clientData: ClientData.fromJson(json["ClientData"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "ClientData": clientData.toJson(),
      };
}

class ClientData {
  String client;
  String clientShortCode;
  String area;
  String email;
  String contactNo;
  int firstcreditLimit;
  String frcreditLtDays;
  int secondcreditLimit;
  String sdCrlmDays;
  String accPerson;
  String state;
  String country;
  String shipTo;
  String grade;
  String gstNumber;
  String location;
  String pincode;
  String mobile;
  String panNumber;
  String city;
  String stateCode;
  String beneficiary;

  ClientData({
    required this.client,
    required this.clientShortCode,
    required this.area,
    required this.email,
    required this.contactNo,
    required this.firstcreditLimit,
    required this.frcreditLtDays,
    required this.secondcreditLimit,
    required this.sdCrlmDays,
    required this.accPerson,
    required this.state,
    required this.country,
    required this.shipTo,
    required this.grade,
    required this.gstNumber,
    required this.location,
    required this.pincode,
    required this.mobile,
    required this.panNumber,
    required this.city,
    required this.stateCode,
    required this.beneficiary,
  });

  factory ClientData.fromJson(Map<String, dynamic> json) => ClientData(
        client: json["client"],
        clientShortCode: json["clientShortCode"],
        area: json["area"],
        email: json["email"],
        contactNo: json["contactNo"],
        firstcreditLimit: json["firstcreditLimit"],
        frcreditLtDays: json["frcreditLtDays"],
        secondcreditLimit: json["secondcreditLimit"],
        sdCrlmDays: json["sdCrlmDays"],
        accPerson: json["accPerson"],
        state: json["state"],
        country: json["country"],
        shipTo: json["shipTo"],
        grade: json["grade"],
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
        "client": client,
        "clientShortCode": clientShortCode,
        "area": area,
        "email": email,
        "contactNo": contactNo,
        "firstcreditLimit": firstcreditLimit,
        "frcreditLtDays": frcreditLtDays,
        "secondcreditLimit": secondcreditLimit,
        "sdCrlmDays": sdCrlmDays,
        "accPerson": accPerson,
        "state": state,
        "country": country,
        "shipTo": shipTo,
        "grade": grade,
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

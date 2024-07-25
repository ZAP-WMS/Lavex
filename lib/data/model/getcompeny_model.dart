class Getallcompeney {
  String? message;
  bool? success;
  List<Data>? data;

  Getallcompeney({this.message, this.success, this.data});

  Getallcompeney.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? bulstat;
  String? registrationAddress;
  String? city;
  String? accountPerson;
  String? translationName;
  int? iV;
  String? bankDetail;
  String? chooseLogoFile;
  String? email;
  String? gstNumber;
  String? mobile;
  String? panNumber;
  String? stateCode;
  String? website;

  Data(
      {this.sId,
      this.name,
      this.bulstat,
      this.registrationAddress,
      this.city,
      this.accountPerson,
      this.translationName,
      this.iV,
      this.bankDetail,
      this.chooseLogoFile,
      this.email,
      this.gstNumber,
      this.mobile,
      this.panNumber,
      this.stateCode,
      this.website});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    bulstat = json['bulstat'];
    registrationAddress = json['registrationAddress'];
    city = json['city'];
    accountPerson = json['accountPerson'];
    translationName = json['translationName'];
    iV = json['__v'];
    bankDetail = json['bankDetail'];
    chooseLogoFile = json['chooseLogoFile'];
    email = json['email'];
    gstNumber = json['gstNumber'];
    mobile = json['mobile'];
    panNumber = json['panNumber'];
    stateCode = json['stateCode'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['bulstat'] = this.bulstat;
    data['registrationAddress'] = this.registrationAddress;
    data['city'] = this.city;
    data['accountPerson'] = this.accountPerson;
    data['translationName'] = this.translationName;
    data['__v'] = this.iV;
    data['bankDetail'] = this.bankDetail;
    data['chooseLogoFile'] = this.chooseLogoFile;
    data['email'] = this.email;
    data['gstNumber'] = this.gstNumber;
    data['mobile'] = this.mobile;
    data['panNumber'] = this.panNumber;
    data['stateCode'] = this.stateCode;
    data['website'] = this.website;
    return data;
  }
}

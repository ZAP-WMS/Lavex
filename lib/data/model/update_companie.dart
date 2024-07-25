class Updatecompeney {
  String? name;
  String? bulstat;
  String? registrationAddress;
  String? city;
  String? accountPerson;
  String? mobile;
  String? gstNumber;
  String? panNumber;
  String? email;
  String? website;
  String? stateCode;
  String? bankDetail;
  String? chooseLogoFile;

  Updatecompeney(
      {this.name,
      this.bulstat,
      this.registrationAddress,
      this.city,
      this.accountPerson,
      this.mobile,
      this.gstNumber,
      this.panNumber,
      this.email,
      this.website,
      this.stateCode,
      this.bankDetail,
      this.chooseLogoFile});

  Updatecompeney.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bulstat = json['bulstat'];
    registrationAddress = json['registrationAddress'];
    city = json['city'];
    accountPerson = json['accountPerson'];
    mobile = json['mobile'];
    gstNumber = json['gstNumber'];
    panNumber = json['panNumber'];
    email = json['email'];
    website = json['website'];
    stateCode = json['stateCode'];
    bankDetail = json['bankDetail'];
    chooseLogoFile = json['chooseLogoFile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['bulstat'] = this.bulstat;
    data['registrationAddress'] = this.registrationAddress;
    data['city'] = this.city;
    data['accountPerson'] = this.accountPerson;
    data['mobile'] = this.mobile;
    data['gstNumber'] = this.gstNumber;
    data['panNumber'] = this.panNumber;
    data['email'] = this.email;
    data['website'] = this.website;
    data['stateCode'] = this.stateCode;
    data['bankDetail'] = this.bankDetail;
    data['chooseLogoFile'] = this.chooseLogoFile;
    return data;
  }
}

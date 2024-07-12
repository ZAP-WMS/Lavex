class Singelcompeney {
  String? sId;
  String? name;
  String? bulstat;
  String? registrationAddress;
  String? city;
  String? accountPerson;
  String? translationName;
  String? mobile;

  Singelcompeney(
      {this.sId,
      this.name,
      this.bulstat,
      this.registrationAddress,
      this.city,
      this.accountPerson,
      this.translationName,
      this.mobile});

  Singelcompeney.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    bulstat = json['bulstat'];
    registrationAddress = json['registrationAddress'];
    city = json['city'];
    accountPerson = json['accountPerson'];
    translationName = json['translationName'];
    mobile = json['mobile'];
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
    data['mobile'] = this.mobile;
    return data;
  }
}

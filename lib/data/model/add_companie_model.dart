class addcompeney {
  String? name;
  String? bulstat;
  String? registrationAddress;
  String? city;
  String? accountPerson;

  addcompeney(
      {this.name,
      this.bulstat,
      this.registrationAddress,
      this.city,
      this.accountPerson});

  addcompeney.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bulstat = json['bulstat'];
    registrationAddress = json['registrationAddress'];
    city = json['city'];
    accountPerson = json['accountPerson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['bulstat'] = this.bulstat;
    data['registrationAddress'] = this.registrationAddress;
    data['city'] = this.city;
    data['accountPerson'] = this.accountPerson;
    return data;
  }
}

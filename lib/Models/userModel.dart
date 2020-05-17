class UserModel {
  String firstName;
  String lastName;
  String email;
  String phone;
  String countryCode;

  UserModel({
    this.countryCode,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    countryCode = json['country-code'];
    firstName = json['first-name'];
    lastName = json['last-name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country-code'] = this.countryCode;
    data['first-name'] = this.firstName;
    data['last-name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

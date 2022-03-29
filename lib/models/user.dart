import 'package:cyient_assignment/models/company.dart';

import 'address.dart';

class User {
  final int id;
  final String name;
  final String userName;
  final String email;
  final String phone;
  final String website;
  final Address address;
  final Company company;

  User(this.id, this.name, this.userName, this.email, this.phone, this.website,
      this.address, this.company);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['name'],
      json['username'],
      json['email'],
      json['phone'],
      json['website'],
      Address.fromJson(json['address']),
      Company.fromJson(json['company']),
    );
  }
}

import 'geo.dart';

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address(this.street, this.suite, this.city, this.zipcode, this.geo);

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      json['street'],
      json['suite'],
      json['city'],
      json['zipcode'],
      Geo.fromJson(json['geo']),
    );
  }
}

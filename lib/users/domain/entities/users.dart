import 'package:equatable/equatable.dart';

class Users extends Equatable {
  Users({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  @override
  List<Object?> get props =>
      [id, name, username, email, address, phone, website, company];
}

class Address extends Equatable {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  @override
  List<Object?> get props => [street, suite, city, zipcode];
}

class Geo extends Equatable {
  Geo({
    required this.lat,
    required this.lng,
  });

  String lat;
  String lng;

  @override
  List<Object?> get props => [lat, lng];
}

class Company extends Equatable {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  String name;
  String catchPhrase;
  String bs;

  @override
  List<Object?> get props => [name, catchPhrase, bs];
}

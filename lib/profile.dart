import 'dart:convert';

class Profile {
  Profile({
    this.id,
    this.name,
    this.email,
    this.password
  });

  int id;
  String name;
  String email;
  String password;





  Map<String, dynamic> toJson() => {
    "res.Id": id,
    "name": name,
    "email": email,
    "password": password,
  };
}
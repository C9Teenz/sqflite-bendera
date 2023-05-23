// To parse this JSON data, do
//
//     final RegisterModel = RegisterModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  final String name;
  final String email;
  final String password;
  final String avatar;

  RegisterModel({
    required this.name,
    required this.email,
    required this.password,
    this.avatar = "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "avatar": avatar,
      };
}

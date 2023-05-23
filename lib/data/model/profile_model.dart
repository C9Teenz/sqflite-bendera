// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);


import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    final int id;
    final String email;
    final String password;
    final String name;
    final String role;
    final String avatar;
    final DateTime creationAt;
    final DateTime updatedAt;

    ProfileModel({
        required this.id,
        required this.email,
        required this.password,
        required this.name,
        required this.role,
        required this.avatar,
        required this.creationAt,
        required this.updatedAt,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        role: json["role"],
        avatar: json["avatar"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "name": name,
        "role": role,
        "avatar": avatar,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

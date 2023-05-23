import 'dart:convert';

import 'package:crud_bendera/data/api/api.dart';
import 'package:crud_bendera/data/model/barang_model.dart';
import 'package:crud_bendera/data/model/login_model.dart';
import 'package:crud_bendera/data/model/profile_model.dart';
import 'package:crud_bendera/data/model/register_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../model/token_model.dart';

class ApiRepositories {
  final storage = const FlutterSecureStorage();
  final nametoken = "token";
  String token = "";
  List<Map<String, dynamic>> xy = [];
  Future<void> register(RegisterModel regis) async {
    await http.post(Uri.parse(ApiResources.register), body: regis.toJson());
  }

  Future<void> login(LoginModel login) async {
    final response =
        await http.post(Uri.parse(ApiResources.login), body: login.toMap());
    Tokenmodel x = tokenmodelFromJson(response.body);
    
    await storage.write(key: nametoken, value: x.accessToken);
  }

  Future<ProfileModel> getProfile() async {
    token = await storage.read(key: nametoken) ?? "";
    final response = await http.get(
        Uri.parse('https://api.escuelajs.co/api/v1/auth/profile'),
        headers: {'Authorization': 'Bearer $token'});
    print(response.body);
    ProfileModel profileModel = profileModelFromJson(response.body);

    return profileModel;
  }

  Future<void> logout() async {
    await storage.delete(key: nametoken);
    token = "";
  }

  Future<void> addBarangUser(String name, BarangModel barang) async {
    xy.add(barang.toMap());

    await storage.write(key: name, value: jsonEncode(xy));
  }

  Future<List<BarangModel>> getBarangUser(String name) async {
    var x = await storage.read(key: name);
    if (x != null) {
      List<dynamic> result = jsonDecode(x);
      xy = result
          .whereType<Map<String, dynamic>>()
          .cast<Map<String, dynamic>>()
          .map((item) => Map<String, dynamic>.from(item))
          .toList();
      print(xy);
      List<BarangModel> list =
          result.map((e) => BarangModel.fromJson(e)).toList();

      return list;
    } else {
      return [];
    }
  }
}

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class BarangModel {
  final int id;
  final String? name;
  final int? quantity;
  final int harga;
  final String suplayer;
  BarangModel({
    required this.id,
    this.name,
    this.quantity,
    required this.harga,
    required this.suplayer,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'quantity': quantity,
      'harga': harga,
      'suplayer': suplayer
    };
  }

  factory BarangModel.fromJson(Map<String, dynamic> json) => BarangModel(
        id: json["_id"] ?? 0,
        name: json["name"],
        quantity: json["quantity"],
        harga: json["harga"],
        suplayer: json["suplayer"],
      );

  String toJson() => json.encode(toMap());
}

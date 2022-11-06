// To parse this JSON data, do
//
//     final detail = detailFromJson(jsonString);

import 'dart:convert';

import 'package:proyect_clean/detail/domain/entities/detail.dart';

List<DetailModel> detailFromJson(String str) => List<DetailModel>.from(
    json.decode(str).map((x) => DetailModel.fromJson(x)));

String detailToJson(List<DetailModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailModel extends Detail {
  DetailModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  }) : super(userId: userId, id: id, title: title, body: body);

  final int userId;
  final int id;
  final String title;
  final String body;

  factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}

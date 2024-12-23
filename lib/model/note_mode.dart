// To parse this JSON data, do
//
//     final noteModel = noteModelFromJson(jsonString);

import 'dart:convert';

List<NoteModel> noteModelFromJson(String str) => List<NoteModel>.from(json.decode(str).map((x) => NoteModel.fromJson(x)));

String noteModelToJson(List<NoteModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NoteModel {
  String? title;
  String? description;
  String? date;
  String? time;
  String? id;

  NoteModel({
  this.title,
  this.description,
  this.date,
  this.time,
  this.id,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
    title: json["title"],
    description: json["description"],
    date: json["date"],
    time: json["time"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "date": date,
    "time": time,
    "id": id,
  };
}

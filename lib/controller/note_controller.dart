import 'dart:convert';

import 'package:crud_operation/model/note_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class NoteController extends GetxController {
  String url = "https://673012ed66e42ceaf15f4989.mockapi.io/note";
  RxList<NoteModel> noteList = RxList<NoteModel>();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    getNote();
  }

  Future<void> getNote() async {
    var response = await http.get(Uri.parse(url));
    var notes = jsonDecode(response.body);
    for (var note in notes) {
      noteList.add(NoteModel.fromJson(note));
    }
    print("Get Note");
  }

  Future<void> addNote() async {
    var newNote = NoteModel(
      title: title.text,
      description: description.text,
      date: DateTime.now().toString(),
      time: "",
    );
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(newNote.toJson()),
        headers: {"Content-Type": "Application/json"});
    if (response.statusCode == 201) {
      print("Add Note");
    }
  }
}

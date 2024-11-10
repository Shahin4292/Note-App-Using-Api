import 'dart:convert';

import 'package:crud_operation/model/note_mode.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class NoteController extends GetxController {
  String url = "https://673012ed66e42ceaf15f4989.mockapi.io/note";
  RxList<NoteModel> noteList = RxList<NoteModel>();

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
    print("Note Get");
  }
}

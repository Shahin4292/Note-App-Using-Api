import 'package:crud_operation/controller/note_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNote extends StatelessWidget {
  AddNote({super.key});

  NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: const Text(
          "Add Note",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: noteController.title,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "title",
                  hintStyle: TextStyle(fontSize: 20)),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: noteController.description,
              maxLines: 20,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "description",
                  hintStyle: TextStyle(fontSize: 20)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.sizeOf(context).width, 55),
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {
                noteController.addNote();
              },
              child: const Text(
                "Save",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

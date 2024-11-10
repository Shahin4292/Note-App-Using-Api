import 'package:crud_operation/controller/note_controller.dart';
import 'package:crud_operation/view/add_note.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteView extends StatelessWidget {
  NoteView({super.key});

  NoteController noteController = Get.put(NoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,
          title: const Text(
            "Api Note",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          onPressed: () {
            Get.to(AddNote());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Obx(() => GridView.builder(
                  itemCount: noteController.noteList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final notes = noteController.noteList[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    notes.title!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black54),
                                  ),
                                  Text(notes.description!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          color: Colors.black54)),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  print(notes.id);
                                  noteController.deleteNote(notes.id!);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.black54,
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                ))));
  }
}

// GridView.count(
// crossAxisCount: 2,
// crossAxisSpacing: 10,
// mainAxisSpacing: 10,
// children: noteController.noteList
//     .map((element) => const Text("data"))
// .toList(),
// )

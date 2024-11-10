import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          "Add Note",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "title",
                hintStyle: TextStyle(fontSize: 20)),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            maxLines: 20,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "description",
                hintStyle: TextStyle(fontSize: 20)),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Save",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

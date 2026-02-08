import 'package:flutter/material.dart';
import 'package:fnflutter/models/note_model.dart';
import 'package:fnflutter/screens/home.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key, required this.createNote});

  final Function(NoteModel) createNote;

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Note")),
      body: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(hintText: "Title"),
          ),
          Expanded(
            child: TextFormField(
              controller: bodyController,
              decoration: InputDecoration(hintText: "Body"),
              maxLines: null,
              expands: true,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          var errorMessage = "";
          if (titleController.text.isEmpty) {
            errorMessage = "${errorMessage} Title is missing.";
          }
          if (bodyController.text.isEmpty) {
            errorMessage = "${errorMessage} Body is missing";
          }
          // first validate data
          if (errorMessage != "") {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Failed to save note: ${errorMessage}"),
                behavior: SnackBarBehavior.floating,
              ),
            );
            return;
          }
          NoteModel note = NoteModel(
            title: titleController.text,
            body: bodyController.text,
          );
          widget.createNote(note);
          Navigator.of(context).pop();
        },
        label: Text("Save Note"),
      ),
    );
  }
}

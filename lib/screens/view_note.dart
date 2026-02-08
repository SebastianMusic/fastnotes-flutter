import 'package:flutter/material.dart';
import 'package:fnflutter/models/note_model.dart';

class ViewNote extends StatelessWidget {
  const ViewNote({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View note")),
      body: Column(
        children: [
          Text(note.title, style: TextStyle(fontSize: 30)),
          Text(note.body, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

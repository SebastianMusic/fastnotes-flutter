import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fnflutter/models/note_model.dart';
import 'package:fnflutter/screens/create_note.dart';
import 'package:fnflutter/screens/view_note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<NoteModel> noteList = [];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FastNotes!")),
      body: ListView.builder(
        itemCount: noteList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ViewNote(note: noteList[index]),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Text(
                    noteList[index].title,
                    style: TextStyle(fontSize: 30),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Text(
                  //   noteList[index].body,
                  //   style: TextStyle(fontSize: 18),
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateNoteScreen(createNote: createNote),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void createNote(NoteModel note) {
    setState(() {
      noteList.add(note);
    });
  }
}

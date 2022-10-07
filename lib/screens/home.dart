import 'package:flutter/material.dart';
import 'package:flutter_hive/controllers/note_controller.dart';
import 'package:flutter_hive/models/note.dart';
import 'package:flutter_hive/screens/add_delete_note_screen.dart';
import 'package:flutter_hive/widgets/note_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final NoteController noteController = NoteController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Hive Example'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Note>?>(
        future: noteController.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Note> notes = snapshot.data ?? [];
            if (notes.isEmpty) {
              return const Center(
                child: Text("No notes yet"),
              );
            }
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) => NoteWidget(
                note: notes[index],
                onTap: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddNoteScreen(
                        action: noteController.deleteNote,
                        deleteNote: notes[index],
                      ),
                    ),
                  );
                  setState(() {});
                },
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "An error has occurred ${snapshot.error}",
                textAlign: TextAlign.center,
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddNoteScreen(
                action: noteController.addNote,
              ),
            ),
          );
          setState(() {});
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hive/models/note.dart';

class AddNoteScreen extends StatefulWidget {
  final Function(Note) action;
  final Note? deleteNote;
  const AddNoteScreen({
    super.key,
    required this.action,
    this.deleteNote,
  });

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  late final TextEditingController title;
  late final TextEditingController body;

  @override
  void initState() {
    title = TextEditingController(text: widget.deleteNote?.title);
    body = TextEditingController(text: widget.deleteNote?.body);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final text = widget.deleteNote != null ? 'Delete Note' : 'Add Note';
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  key: UniqueKey(),
                  keyboardType: TextInputType.text,
                  controller: title,
                  enabled: widget.deleteNote == null,
                  decoration: InputDecoration(
                    labelText: 'Enter note Title',
                    hintText: 'Your title',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  key: UniqueKey(),
                  enabled: widget.deleteNote == null,
                  keyboardType: TextInputType.text,
                  controller: body,
                  decoration: InputDecoration(
                    labelText: 'Enter note body',
                    hintText: 'Your body',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (title.text.isEmpty || body.text.isEmpty) {
                      return;
                    }
                    final note = widget.deleteNote ??
                        Note(title: title.text, body: body.text);
                    await widget.action(note);
                    if (mounted) Navigator.pop(context);
                  },
                  child: Text(text),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

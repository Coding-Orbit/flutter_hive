import 'package:flutter/material.dart';
import 'package:flutter_hive/models/note.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;
  const NoteWidget({
    super.key,
    required this.note,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('Title: ${note.title}'),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text('Body: ${note.body}'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

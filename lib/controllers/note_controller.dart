import 'package:flutter_hive/models/note.dart';
import 'package:flutter_hive/services/store.dart';

class NoteController {
  late final Store store;

  NoteController() {
    store = Store();
  }

  Future<List<Note>?> getNotes() async => List<Note>.from(
      await store.getValue<List<Note>?>(Store.note, defaultValue: []) ?? []);

  Future<void> addNote(Note note) async {
    final List<Note> notes = List<Note>.from(
        await store.getValue(Store.note, defaultValue: []) ?? []);
    notes.add(note);
    await store.setValue(Store.note, notes);
  }

  Future<void> deleteNote(Note note) async {
    final List<Note> notes = List<Note>.from(
        await store.getValue(Store.note, defaultValue: []) ?? []);
    notes.remove(note);
    await store.setValue(Store.note, notes);
  }
}

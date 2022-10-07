import 'package:flutter_hive/models/note.dart';
import 'package:flutter_hive/services/store.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveInjector {
  static Future<void> setup() async {
    await Hive.initFlutter();
    _registerAdapters();
    await Hive.openBox(Store.storeBox);
  }

  static void _registerAdapters() {
    Hive.registerAdapter(NoteAdapter());
  }
}

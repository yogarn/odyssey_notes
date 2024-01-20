import 'package:hive/hive.dart';
import 'package:odyssey_notes/model/note.dart';

class Boxes {
  static Box<Note> getNotes() =>
      Hive.box<Note>('notes');
}
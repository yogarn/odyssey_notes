import 'package:odyssey_notes/boxes.dart';
import 'package:odyssey_notes/model/note.dart';

Future addNote(
    String title, String body, String place) async {
  final note = Note()
    ..title = title
    ..body = body
    ..time = DateTime.now()
    ..place = (place.isEmpty ? '' : place);

  final box = Boxes.getNotes();
  return box.add(note);
}

Future<void> editNote(int noteKey, String title, String body, String place) async {
  final note = Note()
    ..title = title
    ..body = body
    ..time = DateTime.now()
    ..place = place;

  final box = Boxes.getNotes();
  return box.put(noteKey, note);
}

Future<void> deleteNote(int noteKey) async {
  final box = Boxes.getNotes();
  await box.delete(noteKey);
}

Future<List<Note>> searchNotes(String query) async {
  final box = Boxes.getNotes();
  List<Note> notes = box.values.toList();

  final filteredNotes = notes
      .where((note) =>
          note.title.toLowerCase().contains(query.toLowerCase()) ||
          note.body.toLowerCase().contains(query.toLowerCase()) ||
          note.time.toString().contains(query))
      .toList();

  return filteredNotes;
}

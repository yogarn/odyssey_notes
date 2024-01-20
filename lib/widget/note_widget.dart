// note_widget.dart

import 'package:flutter/material.dart';
import 'package:odyssey_notes/model/note.dart';
import 'package:odyssey_notes/screens/edit_note.dart';
import 'package:odyssey_notes/services/databases.dart';

class NoteWidget extends StatelessWidget {
  final List<Note> notes;

  const NoteWidget(this.notes, {super.key});

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      return const Center(
        child: Text('No notes available.'),
      );
    } else {
      return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final ExpansionTileController expansionController =
              ExpansionTileController();
          return Card(
            elevation: 0,
            color: const Color(0xFF3f3c3c),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.fromLTRB(20, 15, 20, 10),
            child: ExpansionTile(
              controller: expansionController,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('title: ${notes[index].title}'),
                  Text('id: ${notes[index].key.toString()}'),
                  Text('body: ${notes[index].body}'),
                  notes[index].place.isEmpty ? Container() : Text('location : ${notes[index].place}'),
                  Text('time: ${notes[index].time}'),
                ],
              ),
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditNote(noteKey: notes[index].key),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete'),
                          onPressed: () async => deleteNote(notes[index].key),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}

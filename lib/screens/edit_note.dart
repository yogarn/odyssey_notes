import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:odyssey_notes/boxes.dart';
import 'package:odyssey_notes/screens/navbar.dart';
import 'package:odyssey_notes/services/databases.dart';
import 'package:odyssey_notes/widget/note_form.dart';

class EditNote extends StatefulWidget {
  final dynamic noteKey;
  const EditNote({super.key, required this.noteKey});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final keyFormNotes = GlobalKey<FormState>();
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerBody = TextEditingController();
  TextEditingController controllerPlace = TextEditingController();

  String title = '';
  String body = '';
  String place = '';
  Position? coordinate;

  @override
  void initState() {
    super.initState();
    final box = Boxes.getNotes();
    final note = box.get(widget.noteKey);
    if (note != null) {
      controllerTitle.text = note.title;
      controllerBody.text = note.body;
      controllerPlace.text = note.place;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              "Edit Notes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          NoteForm(
            formKey: keyFormNotes,
            controllerTitle: controllerTitle,
            controllerBody: controllerBody,
            controllerPlace: controllerPlace,
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(left: 24, right: 24),
            child: ElevatedButton(
              onPressed: () {
                editNote(widget.noteKey, controllerTitle.text, controllerBody.text, controllerPlace.text);
                setState(() {
                  NavBar.navBarKey.currentState?.setCurrentIndex(0);
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const NavBar()),
                        (Route<dynamic> route) => false,
                  );
                });
              },
              child: const Text("Save"),
            ),
          ),
        ],
      ),
    );
  }
}

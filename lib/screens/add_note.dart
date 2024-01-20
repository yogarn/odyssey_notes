import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:odyssey_notes/screens/navbar.dart';
import 'package:odyssey_notes/services/databases.dart';
import 'package:odyssey_notes/widget/note_form.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final keyFormNotes = GlobalKey<FormState>();
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerBody = TextEditingController();
  TextEditingController controllerPlace = TextEditingController();

  String title = '';
  String body = '';
  String place = '';
  Position? coordinate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              "Input Notes",
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
                addNote(controllerTitle.text, controllerBody.text, controllerPlace.text);
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

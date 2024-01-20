import 'package:flutter/material.dart';
import 'package:odyssey_notes/model/note.dart';
import 'package:odyssey_notes/services/databases.dart';
import 'package:odyssey_notes/widget/note_widget.dart';

class SearchNotes extends StatefulWidget {
  const SearchNotes({super.key});

  @override
  State<SearchNotes> createState() => _SearchNotesState();
}

class _SearchNotesState extends State<SearchNotes> {
  final keyFormSearch = GlobalKey<FormState>();
  TextEditingController controllerSearch = TextEditingController();
  String search = "";

  List<Note> notes = [];

  bool isNoResult = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Notes')),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: Form(
              key: keyFormSearch,
              child: TextFormField(
                controller: controllerSearch,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
                  hintText: 'Search...',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      if (keyFormSearch.currentState!.validate()) {
                        await _startSearch(controllerSearch.text);
                      }
                    },
                  ),
                ),
                validator: _onValidateText,
              ),
            ),
          ),
          Expanded(
              child: notes.isEmpty
                  ? isNoResult
                      ? const Text(
                          'No results to display, try searching another one')
                      : const Text(
                          'Start searching by clicking the search icon')
                  : NoteWidget(notes))
        ],
      ),
    );
  }

  Future<void> _startSearch(String query) async {
    final result = await searchNotes(query); // Replace with your actual search function

    setState(() {
      notes = result;
      isNoResult = notes.isEmpty;
    });
  }

  String? _onValidateText(String? value) {
    if (value?.isEmpty ?? true) return 'Can\'t be empty';
    return null;
  }
}

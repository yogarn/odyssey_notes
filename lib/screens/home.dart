import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:odyssey_notes/boxes.dart';
import 'package:odyssey_notes/model/note.dart';
import 'package:odyssey_notes/screens/add_note.dart';
import 'package:odyssey_notes/widget/note_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Widget buildContent(List<Note> notes) {
  //   if (notes.isEmpty) {
  //     return const Center(
  //       child: Text('No notes available.'),
  //     );
  //   } else {
  //     return ListView.builder(
  //       itemCount: notes.length,
  //       itemBuilder: (context, index) {
  //         final ExpansionTileController expansionController =
  //             ExpansionTileController();
  //         return Card(
  //           elevation: 0,
  //           color: Color(0xFF3f3c3c),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(10)),
  //           ),
  //           clipBehavior: Clip.antiAlias,
  //           margin: EdgeInsets.fromLTRB(20, 15, 20, 10),
  //           child: ExpansionTile(
  //               controller: expansionController,
  //               title: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text('title: ${notes[index].title}'),
  //                   Text('id: ${notes[index].key.toString()}'),
  //                   Text('body: ${notes[index].body}'),
  //                   Text('time: ${notes[index].time}'),
  //                 ],
  //               ),
  //               children: [
  //                 Container(
  //                   margin: const EdgeInsets.all(10),
  //                   child: Row(
  //                     children: [
  //                       Expanded(
  //                           child: ElevatedButton.icon(
  //                         icon: Icon(Icons.edit),
  //                         label: Text('Edit'),
  //                         onPressed: () {
  //                           Navigator.push(
  //                             context,
  //                             MaterialPageRoute(
  //                               builder: (context) =>
  //                                   EditNote(noteKey: notes[index].key),
  //                             ),
  //                           );
  //                         },
  //                       )),
  //                       SizedBox(
  //                         width: 10,
  //                       ),
  //                       Expanded(
  //                           child: ElevatedButton.icon(
  //                         icon: Icon(Icons.delete),
  //                         label: Text('Delete'),
  //                         onPressed: () async => deleteNote(notes[index].key),
  //                       )),
  //                     ],
  //                   ),
  //                 ),
  //               ]),
  //         );
  //       },
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        icon: Icons.create,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.purple[200],
        activeBackgroundColor: Colors.purple,
        overlayColor: Colors.black,
        spacing: 15.0,
        shape: const CircleBorder(),
        children: [
          SpeedDialChild(
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
            backgroundColor: Colors.purple[300],
            label: 'Add Note',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNote(),
                ),
              );
            },
          ),
          SpeedDialChild(
            shape: const CircleBorder(),
            child: const Icon(Icons.edit),
            backgroundColor: Colors.purple[300],
            label: 'Edit Note',
            onTap: () {
              // Handle edit action
            },
          ),
          // Add more SpeedDialChild widgets for additional options
        ],
      ),
      appBar: AppBar(title: const Text('Odyssey Notes')),
      body: ValueListenableBuilder<Box<Note>>(
          valueListenable: Boxes.getNotes().listenable(),
          builder: (context, box, _) {
            final notes = box.values.toList().cast<Note>();
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(child: NoteWidget(notes)),
              ],
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:odyssey_notes/model/note.dart';
import 'package:odyssey_notes/screens/navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(NoteAdapter());
  await Hive.openBox<Note>('notes');

  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        dividerColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF2e2b2b),
        ),
      ),
      home: const NavBar(),
    );
  }
}

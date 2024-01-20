import 'package:flutter/material.dart';
import 'package:odyssey_notes/screens/home.dart';
import 'package:odyssey_notes/screens/search.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});
  static GlobalKey<_NavBarState> navBarKey = GlobalKey<_NavBarState>();

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;

  void setCurrentIndex(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.purple[300],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          // NavigationDestination(
          //   icon: Icon(Icons.add),
          //   label: 'Add Note',
          // ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
      body: <Widget>[const HomeScreen(), const SearchNotes()][currentPageIndex],
    );
  }
}
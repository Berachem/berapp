import 'package:berapp/pages/home_page.dart';
import 'package:berapp/pages/projects_page.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomAppBarCustom extends StatefulWidget {
  int selectedIndex = 0;

  BottomAppBarCustom({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<BottomAppBarCustom> createState() => _BottomAppBarCustomState();
}

class _BottomAppBarCustomState extends State<BottomAppBarCustom> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    final onClickFunctions = [
      // Go to home page
      HomePage(),
      // Go to projects page
      ProjectsPage(),
    ];

    return SalomonBottomBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff6200ee),
        unselectedItemColor: const Color(0xff757575),
        onTap: (index) {
          if (index == _selectedIndex) return;

          setState(() {
            _selectedIndex = index;
          });
          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => onClickFunctions[index]));
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => onClickFunctions[index]));
        },
        items: _navBarItems);
  }
}

final _navBarItems = [
  SalomonBottomBarItem(
    icon: const Icon(Icons.home),
    title: const Text("Accueil"),
    selectedColor: Colors.blue,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.library_books),
    title: const Text("Projets"),
    selectedColor: Colors.pink,
  ),
/*   SalomonBottomBarItem(
    icon: const Icon(Icons.search),
    title: const Text("Search"),
    selectedColor: Colors.orange,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.person),
    title: const Text("Profile"),
    selectedColor: Colors.teal,
  ), */
];

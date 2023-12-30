import 'package:berapp/pages/home_page.dart';
import 'package:berapp/pages/projects_page.dart';
import 'package:flutter/material.dart';

class BottomAppBarCustom extends StatefulWidget {
  const BottomAppBarCustom({super.key});

  @override
  _BottomAppBarCustomState createState() => _BottomAppBarCustomState();
}

class _BottomAppBarCustomState extends State<BottomAppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5.0,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home , color:  Color.fromARGB(255, 6, 14, 29)),
              onPressed: () {
                // Go to home page
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              tooltip: 'Accueil',

            ),
            IconButton(
              icon: const Icon(Icons.library_books, color:  Color.fromARGB(255, 6, 14, 29)),
              onPressed: () {
                 // Go to projects page
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProjectsPage()));
              },
              tooltip: 'Projets',
            ),
      
          ],
        ),
      ),
    );
  }
}

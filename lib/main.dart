
import 'package:berapp/pages/home_page.dart';
import 'package:berapp/pages/projects_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projets Berachem',
    
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color.fromARGB(255, 6, 14, 29),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 87, 137, 231),
        ),
        textTheme:  const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          headlineSmall: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            decoration: TextDecoration.underline,
          ),

        )
      ),
      home: const HomePage(),
      
    );
  }
}


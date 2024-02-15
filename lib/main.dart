import 'package:flutter/material.dart';
import 'package:nasa_files/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Nasa APIS',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.light,
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
            titleMedium: TextStyle(fontSize: 24, color: Colors.black),
          ),
          useMaterial3: true,
        ),
        home: HomeScreen());
  }
}

import 'package:flutter/material.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Palette Image App',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.dark),
      ),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}

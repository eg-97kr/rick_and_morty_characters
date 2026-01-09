import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/app/main_screen.dart';

class CharactersApp extends StatelessWidget {
  const CharactersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick & Morty',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      home: const MainScreen(),
    );
  }
}

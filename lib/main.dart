import 'package:flutter/material.dart';
import 'package:travel_app/pages/welcome_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF9290C3)),
          useMaterial3: true,
        ),
        home: const WelcomePage());
  }
}

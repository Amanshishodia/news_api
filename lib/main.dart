import 'package:flutter/material.dart';
import 'package:newsapp/config/Theme.dart';
import 'package:newsapp/pages/HomePage/home_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: lightTheme,  // Light theme defined
      darkTheme: darkTheme,  // Dark theme defined
      themeMode: ThemeMode.system,  // System mode (light/dark based on device settings)
      home: HomePage(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/config/Theme.dart';
import 'package:newsapp/controller/bottomNavigation.dart';
import 'package:newsapp/homepageController.dart';
import 'package:newsapp/pages/HomePage/home_page.dart';

void main() {
   // Ensure that all necessary Flutter bindings are initialized
  // WidgetsFlutterBinding.ensureInitialized();
  // // Hiding the system bottom navigation bar
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: lightTheme, // Light theme defined
      darkTheme: darkTheme, // Dark theme defined
      themeMode:
          ThemeMode.system, // System mode (light/dark based on device settings)
      home: Homepagecontroller()
    );
  }
}

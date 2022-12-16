import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/variables/themes.dart';
import 'package:test/views/interfaces/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      theme: lightTheme,
      home: const HomePage(),
    );
  }
}

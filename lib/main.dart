import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test/controllers/controller_binding.dart';
import 'package:test/variables/themecontroller.dart';
import 'package:test/variables/themes.dart';

import 'package:test/views/interfaces/home.dart';

void main() async {
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.indigo,
      systemNavigationBarDividerColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemStatusBarContrastEnforced: true,
      statusBarBrightness: Brightness.light,
      systemNavigationBarContrastEnforced: true));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      themeMode: ThemeController().theme,
      theme: lightTheme,
      home: const HomePage(),
    );
  }
}

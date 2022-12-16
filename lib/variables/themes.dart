import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final police = GoogleFonts.poppins(fontSize: 14, letterSpacing: 2);
final title1 = police.copyWith(fontWeight: FontWeight.bold, fontSize: 18);
final title2 = title1.copyWith(fontSize: 16);
const indigo = Colors.indigo;
final fondColors = Colors.grey.shade300;
final appBarpolice = title1.copyWith(
    fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 1.0);
final blanclaire = Colors.white.withOpacity(0.8);

final darmode =
    ThemeData(brightness: Brightness.dark, primaryColor: Colors.blue);
final lightMode =
    ThemeData(brightness: Brightness.light, primaryColor: Colors.blue);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ));

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ));

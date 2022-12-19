import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final police = GoogleFonts.poppins(fontSize: 14, letterSpacing: 2);
final title1 = police.copyWith(fontWeight: FontWeight.bold, fontSize: 18);
final title2 = title1.copyWith(fontSize: 16);
const indigo = Colors.indigo;
final fondColors = Colors.grey.shade300;
final fonddark = Colors.grey.shade900;
final appBarpolice = title1.copyWith(
    fontSize: 16, fontWeight: FontWeight.w900, letterSpacing: 0.0);
final blanclaire = Colors.white.withOpacity(0.94);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.indigo,
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
);

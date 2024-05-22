import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  static final theme = ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.robotoTextTheme().apply(bodyColor: Colors.white),
  );
}
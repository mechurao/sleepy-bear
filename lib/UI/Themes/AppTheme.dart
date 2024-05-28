import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleepy_bear/Values/AppColors.dart';

class AppTheme{
  static final theme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.nunito().fontFamily,
    colorSchemeSeed: AppColors.popUpColor,
    textTheme: TextTheme(

    )
  );
}
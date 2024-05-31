import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleepy_bear/Values/AppColors.dart';

class AppTheme{
  static final theme = ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.nunito().fontFamily,
      colorSchemeSeed: AppColors.defaultTextColor,
      scaffoldBackgroundColor: Colors.transparent,
      //splashFactory: NoSplash.splashFactory,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: AppColors.defaultTextColor,
        unselectedItemColor: AppColors.inputColor,
      ),


    dividerTheme: DividerThemeData(
      thickness: 0.7,
      color: AppColors.inputColor.withOpacity(0.25),
      space: 0
    ),

    bottomSheetTheme: BottomSheetThemeData(
     backgroundColor: AppColors.defaultTextColor,
      showDragHandle: true,
      dragHandleSize: Size(50, 3)
    ),


  );
}

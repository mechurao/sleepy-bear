import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_context/one_context.dart';
import 'package:sleepy_bear/Values/AppColors.dart';
import 'package:sleepy_bear/Values/dimensions.dart';

abstract class Styles{
  static TextStyle get header{
    return OneContext().theme.textTheme.headlineLarge!.copyWith(
      fontSize: Dimensions.headerFontSize,
      color: AppColors.popUpColor,
      fontFamily: GoogleFonts.titanOne().fontFamily,
      fontWeight: FontWeight.w400
    );
  }

  static TextStyle title(){
    return OneContext().theme.textTheme.titleLarge!.copyWith(
      fontSize: Dimensions.titleFontSize,
      fontWeight: FontWeight.w900

    );

  }

}
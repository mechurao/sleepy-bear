import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_context/one_context.dart';
import 'package:sleepy_bear/Values/AppColors.dart';
import 'package:sleepy_bear/Values/dimensions.dart';

abstract class Styles{
  
  static Color _textColor(Color? color){
    if(color != null){return color;}
    return AppColors.defaultTextColor;
  }
  
  static TextStyle get header{
    return GoogleFonts.titanOne(
      fontSize: Dimensions.headerFontSize,
      color: AppColors.defaultTextColor,
      fontWeight: FontWeight.w400
    );
  }

  static TextStyle  title({Color? color}){
    return GoogleFonts.nunito(
      fontWeight: FontWeight.w900,
      fontSize: Dimensions.titleFontSize,
      color: _textColor(color)
    );
  }

  static TextStyle content({Color? color, FontWeight? weight, double? size}){

    final fontWeight = (weight != null) ? weight : FontWeight.w700;
    final fontSize = (size != null) ? size : Dimensions.contentFontSize;

    return GoogleFonts.nunito(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: _textColor(color)
    );
  }

  static TextStyle note({Color? color, double? size, bool? italic}){
    final fontSize = (size != null) ? size : Dimensions.noteFontSize;
    final fontStyle = (italic != null && italic) ? FontStyle.italic : FontStyle.normal;
    return GoogleFonts.nunito(
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontWeight: FontWeight.w700,
      color: _textColor(color),
    );

  }

}
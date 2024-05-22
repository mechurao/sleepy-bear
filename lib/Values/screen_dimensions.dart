import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

abstract class ScreenDimensions{
  static double getScreenWidth(){
    return MediaQuery.of(OneContext().context!).size.width;
  }

  static double getScreenHeight(){
    return MediaQuery.of(OneContext().context!).size.height;
  }
}
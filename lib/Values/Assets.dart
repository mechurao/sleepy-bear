import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Assets{
  static const  String _assetsPath = "assets/";
  static const String _bearPath = "${_assetsPath}bear/";

  static Widget bearWelcome = Image.asset("${_bearPath}bear_welcome.png");


}
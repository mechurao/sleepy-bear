import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Assets{
  static const  String _assetsPath = "assets/";
  static const String _bearPath = "${_assetsPath}bear/";
  static const String _iconsPath = "${_assetsPath}icons/";
  static const String _navBarIconsPath = "${_iconsPath}navBar/";
  static const String _socialIconsPath = "${_iconsPath}social/";

  static Widget bearWelcome = Image.asset("${_bearPath}bear_welcome.png");
  static Widget checkIcon = Image.asset("${_iconsPath}check.png");

  // bottom navigation bar
  static Widget listenIcon = Image.asset("${_navBarIconsPath}listen_icon.png");
  static Widget settingsIcon = Image.asset("${_navBarIconsPath}settings_icon.png");
  static Widget storiesIcon = Image.asset("${_navBarIconsPath}stories_icon.png");

  // social buttons
static Widget appleIcon = Image.asset("${_socialIconsPath}apple.png");
static Widget googleIcon = Image.asset("${_socialIconsPath}google.png");
static Widget facebookIcon = Image.asset("${_socialIconsPath}facebook.png");
static Widget mailIcon = Image.asset("${_socialIconsPath}mail.png");
}
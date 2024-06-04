import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Assets{
  static const  String _assetsPath = "assets/";
  static const String _bearPath = "${_assetsPath}bear/";
  static const String _iconsPath = "${_assetsPath}icons/";
  static const String _navBarIconsPath = "${_iconsPath}navBar/";
  static const String _socialIconsPath = "${_iconsPath}social/";
  static const String _settingsIconsPath = "${_iconsPath}settings/";
  static const String _privacyIconsPath = "${_iconsPath}privacy/";
  static const String _navigationPath = "${_iconsPath}navigation/";

  static Widget bearWelcome = Image.asset("${_bearPath}bear_welcome.png");
  static Widget bearWave = Image.asset("${_bearPath}bear_wave.png");
  static Widget bearBubble = Image.asset("${_bearPath}bear_bubble.png");

  static Widget enterIcon = Image.asset(("${_iconsPath}enter.png"));


  static Widget checkIcon = Image.asset("${_iconsPath}check.png");
  static Widget checkboxIcon = Image.asset("${_iconsPath}checkbox.png");

  // navigation
  static ImageIcon closeIcon = const ImageIcon(AssetImage("${_navigationPath}close.png"));
  static ImageIcon arrowLeftIcon = const ImageIcon(AssetImage("${_navigationPath}arrow_left.png"));

  // bottom navigation bar
  static ImageIcon listenIcon = const ImageIcon(AssetImage("${_navBarIconsPath}sleep_icon.png"));
  static ImageIcon soundsIcon = const ImageIcon(AssetImage("${_navBarIconsPath}sounds_icon.png"));
  static ImageIcon moreIcon = const ImageIcon(AssetImage("${_navBarIconsPath}more_icon.png"));
  static ImageIcon storiesIcon = const ImageIcon(AssetImage("${_navBarIconsPath}stories_icon.png"));

  // social buttons
static Widget appleIcon = Image.asset("${_socialIconsPath}apple.png");
static Widget googleIcon = Image.asset("${_socialIconsPath}google.png");
static Widget facebookIcon = Image.asset("${_socialIconsPath}facebook.png");
static Widget mailIcon = Image.asset("${_socialIconsPath}mail.png");

// privacy
  static Widget privacyBlueIcon = Image.asset("${_privacyIconsPath}privacy_blue.png");
  static Widget privacyWhiteIcon = Image.asset("${_privacyIconsPath}privacy_white.png");

// settings screen
static Widget changeNameIcon = Image.asset("${_settingsIconsPath}change_name.png");
static Widget contactMeIcon = Image.asset("${_settingsIconsPath}contact_me.png");
static Widget deleteAccountIcon = Image.asset("${_settingsIconsPath}delete_account.png");
static Widget logoutIcon = Image.asset("${_settingsIconsPath}logout.png");
static Widget privacyPolicyIcon = Image.asset("${_settingsIconsPath}privacy_policy.png");
static Widget termsOfServiceIcon = Image.asset("${_settingsIconsPath}terms_of_service.png");
static Widget tiktokIcon = Image.asset("${_settingsIconsPath}tiktok.png");
static Widget twitterIcon = Image.asset("${_settingsIconsPath}twitter.png");
static Widget youtubeIcon = Image.asset("${_settingsIconsPath}youtube.png");
}
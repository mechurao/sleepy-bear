import 'package:keyboard_dismisser/keyboard_dismisser.dart';

abstract class Config{
  static const int animationDuration = 900;
  static const int waveDuration = 500;

  static const dismissKeyboardDirections = [GestureType.onTap, GestureType.onPanUpdateDownDirection];

  static const double contentWidthFactor = 0.8;
  static const double inputHeight = 50;
  static const double mainInputHeight = 70;
}
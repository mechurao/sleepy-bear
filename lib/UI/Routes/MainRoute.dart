import 'package:flutter/material.dart';

const int _durationMils = 0;

class MainRoute extends MaterialPageRoute{
  MainRoute({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: _durationMils);
}
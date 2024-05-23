import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Values/strings.dart';

class AppTitle extends StatelessWidget{

  final double _defaultHeight = 33;

  final double? size;
  AppTitle({this.size});

  @override
  Widget build(BuildContext context) {
    final double _size = (size != null) ? size! : _defaultHeight;

    return Text(
        Strings.sleepyBear,
      style: GoogleFonts.titanOne(fontSize: _size, ),
      textAlign: TextAlign.center,
    );
  }
}
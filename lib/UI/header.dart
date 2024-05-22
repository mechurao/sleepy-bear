import 'package:flutter/material.dart';
import 'package:sleepy_bear/UI/app_title.dart';

class Header extends StatelessWidget{
  const Header({super.key});

  final  double _topPadding = 40;

  @override
  Widget build(BuildContext context) {
   return Padding(
       padding: EdgeInsets.only(top: _topPadding),
     child: AppTitle(),
   );
  }
  
}
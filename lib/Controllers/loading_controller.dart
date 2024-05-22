import 'package:flutter/material.dart';
import 'package:sleepy_bear/UI/app_title.dart';

import '../UI/background.dart';


class LoadingController extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LoadingControllerState();
}

class _LoadingControllerState extends State<LoadingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Center(
          child: AppTitle(size: 50,)
        )
      ),
    );
  }
}

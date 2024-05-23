import 'package:flutter/material.dart';
import 'package:sleepy_bear/UI/background.dart';

import '../UI/header.dart';
import '../Values/Assets.dart';

class LoginController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    // Delayed start of animation
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Stack(
          children: [
            const Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Header(),
                ),
              ],
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 900),
              right: _isVisible ? 0 : -MediaQuery.of(context).size.width,
              top: MediaQuery.of(context).size.height * 0.05,
              curve: Curves.easeInOut,
              child: Assets.bearWelcome,
            ),
          ],
        ),
      ),
    );
  }
}

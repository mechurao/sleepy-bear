import 'package:flutter/material.dart';
import 'package:sleepy_bear/Models/names_controller_model.dart';
import 'package:sleepy_bear/UI/Textfields/app_textformfield.dart';
import 'package:sleepy_bear/UI/background.dart';
import 'package:sleepy_bear/UI/header.dart';
import 'package:sleepy_bear/Values/Assets.dart';
import 'package:sleepy_bear/Values/screen_dimensions.dart';
import 'package:sleepy_bear/Values/strings.dart';
import 'package:sleepy_bear/Values/styles.dart';

class NamesController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NamesControllerState();
}

class _NamesControllerState extends State<NamesController> {
  bool _bearVisible = false;

  late NamesControllerModel _model;

  @override
  void initState() {
    super.initState();
    _model = NamesControllerModel();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _bearVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Stack(
        children: [
          SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  const Header(),
                  Text(
                    Strings.welcomeHere,
                    style: Styles.title(),
                  ),
                  Text(
                    Strings.changeNamesMessage,
                    style: Styles.content(),
                  ),
                  AppTextField(
                      label: Strings.childsName
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: SafeArea(
              child: RichText(
                text: TextSpan(
                  children:[
                    WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8, bottom: 2),
                          child: Assets.privacyWhiteIcon,
                        )
                    ),

                    TextSpan(
                      text: Strings.sellDisclaimer,
                      style: Styles.note()
                    )
                  ]
                ),

              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeInOut,
            bottom: _bearVisible ? 0 : -0.3 * ScreenDimensions.getScreenHeight(),
            left: _bearVisible ? 0 : -0.3 * ScreenDimensions.getScreenWidth(),
            child: Assets.bearBubble,
          ),
        ],
      ),
    );
  }
}

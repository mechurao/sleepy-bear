import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:sleepy_bear/Models/names_controller_model.dart';
import 'package:sleepy_bear/UI/Buttons/form_button.dart';
import 'package:sleepy_bear/UI/Textfields/app_textformfield.dart';
import 'package:sleepy_bear/UI/background.dart';
import 'package:sleepy_bear/UI/header.dart';
import 'package:sleepy_bear/Values/AppColors.dart';
import 'package:sleepy_bear/Values/Assets.dart';
import 'package:sleepy_bear/Values/config.dart';
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
  Widget build(BuildContext context) => KeyboardDismisser(
    gestures: Config.dismissKeyboardDirections,
    child: Background(
      child: Stack(
        children: [
          SafeArea(
            child: Scaffold(
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Header(),
                  Padding(
                    padding: const EdgeInsets.only(top: 70, bottom: 40),
                    child: Text(
                      Strings.welcomeHere,
                      style: Styles.title(),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: Config.contentWidthFactor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        Strings.changeNamesMessage,
                        style: Styles.content(),
                      ),
                    ),
                  ),
                  AppTextField(
                    label: Strings.childsName,
                    fillColor: AppColors.defaultTextColor,
                    onChanged: (val) => _model.childNameChanged(val),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: AppTextField(
                      label: Strings.parentsName,
                      fillColor: AppColors.defaultTextColor,
                      onChanged: (val) => _model.parentNameChanged(val),
                    ),
                  ),
                  FormButton(
                      leftIcon: Assets.checkboxIcon,
                      action: () => _model.saveNamesAction(),
                      title: Strings.saveNames
                  ),
                  Spacer(flex: 1,)
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
            duration: const Duration(milliseconds: Config.animationDuration),
            curve: Curves.easeInOut,
            bottom: _bearVisible ? 0 : -0.3 * ScreenDimensions.getScreenHeight(),
            left: _bearVisible ? 0 : -0.3 * ScreenDimensions.getScreenWidth(),
            child: Assets.bearBubble,
          ),
        ],
      ),
    ),
  );
}

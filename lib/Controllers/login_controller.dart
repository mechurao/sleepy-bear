import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleepy_bear/Models/login_controller_model.dart';
import 'package:sleepy_bear/UI/Buttons/Auth%20buttons/apple_button.dart';
import 'package:sleepy_bear/UI/Buttons/Auth%20buttons/fb_button.dart';
import 'package:sleepy_bear/UI/Buttons/Auth%20buttons/google_button.dart';
import 'package:sleepy_bear/UI/background.dart';
import 'package:sleepy_bear/UI/wave_underline.dart';
import 'package:sleepy_bear/Values/dimensions.dart';

import '../UI/header.dart';
import '../Values/AppColors.dart';
import '../Values/Assets.dart';
import '../Values/strings.dart';

class LoginController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  bool _bearVisible = false;

  late LoginControllerModel _model;

  @override
  void initState() {
    super.initState();
    _model = LoginControllerModel();
    // Delayed start of animation
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _bearVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget _checkRow(String text){
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.checkIcon,
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
                text
            ),
          )
        ],
      );
    }

    Widget _infoContainer(){
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(Strings.signUpNow),
          _checkRow(Strings.signUpNote1),
          _checkRow(Strings.signUpNote2),
          _checkRow(Strings.signUpNte3)
        ],
      );
    }

    return Scaffold(
      body: Background(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Header(),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Strings.signUpNow,
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            fontSize: Dimensions.titleFontSize,
                            fontWeight: FontWeight.w900,
                            color: AppColors.defaultTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  _infoContainer(),
                  AppleButton(action: () => _model.appleAuth()),
                  GoogleButton(action: () => _model.googleAuth()),
                  FacebookButton(action: () => _model.fbAuth()),
                  Text(Strings.or, style: TextStyle(color: AppColors.defaultTextColor, fontSize: 14, fontWeight: FontWeight.w700),),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(Strings.alreadyHaveAccount),
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                        child: WaveUnderline(
                            text: Strings.logIn,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          color: AppColors.signUpLinkColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 900),
                right: _bearVisible ? 0 : -MediaQuery.of(context).size.width,
                top: MediaQuery.of(context).size.height * 0.05,
                curve: Curves.easeInOut,
                child: Assets.bearWelcome,
              ),
            ],
          ),
        )
      ),
    );
  }
}

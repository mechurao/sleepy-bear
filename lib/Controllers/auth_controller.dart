import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sleepy_bear/Enums/auth_mode.dart';
import 'package:sleepy_bear/Helpers/link_launcher.dart';
import 'package:sleepy_bear/Models/auth_controller_model.dart';
import 'package:sleepy_bear/UI/Buttons/Auth%20buttons/apple_button.dart';
import 'package:sleepy_bear/UI/Buttons/Auth%20buttons/fb_button.dart';
import 'package:sleepy_bear/UI/Buttons/Auth%20buttons/google_button.dart';
import 'package:sleepy_bear/UI/Buttons/Auth%20buttons/mail_button.dart';
import 'package:sleepy_bear/UI/background.dart';
import 'package:sleepy_bear/UI/wave_underline.dart';
import 'package:sleepy_bear/Values/config.dart';
import 'package:sleepy_bear/Values/styles.dart';
import 'package:sleepy_bear/Values/web_links.dart';

import '../UI/header.dart';
import '../Values/AppColors.dart';
import '../Values/Assets.dart';
import '../Values/strings.dart';

class AuthController extends StatefulWidget {
  const AuthController({super.key});

  @override
  State<StatefulWidget> createState() => _AuthControllerState();
}

class _AuthControllerState extends State<AuthController> {
  bool _bearVisible = false;

  late AuthControllerModel _model;

  @override
  void initState() {
    super.initState();
    _model = AuthControllerModel();
    // Delayed start of animation
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _bearVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _checkRow(String text) {
      return Padding(
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Assets.checkIcon,
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                text,
                style: Styles.content(),
              ),
            )
          ],
        ),
      );
    }

    List<Widget> _content() {
      final title = Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Text(
          _model.title,
          style: Styles.title(),
        ),
      );
      if (_model.authMode == AuthMode.login) {
        return [
          title,
          Text(
            Strings.welcomeMessage,
            style: Styles.content(),
          )
        ];
      }

      return [
        title,
        _checkRow(Strings.signUpNote1),
        _checkRow(Strings.signUpNote2),
        _checkRow(Strings.signUpNte3)
      ];
    }

    Widget _infoContainer() {
      return FractionallySizedBox(
        widthFactor: Config.contentWidthFactor,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _content()),
      );
    }

    return Background(
      child: Stack(
        children: [
          SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  const Header(),
                  _infoContainer(),
                  AppleButton(action: () => _model.appleAuth()),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: GoogleButton(action: () => _model.googleAuth()),
                  ),
                  FacebookButton(action: () => _model.fbAuth()),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      Strings.or,
                      style: TextStyle(
                          color: AppColors.defaultTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  MailButton(
                      title: _model.emailAuthTitle,
                      action: () => _model.emailAuth()),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: _model.optionTitle,
                            style: Styles.content(weight: FontWeight.w900)),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: WaveUnderline(
                              text: _model.switchModeTitle,
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              callback: () {
                                setState(() {
                                  _model.switchMode();
                                });
                              },
                            ),
                          ),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: Config.animationDuration),
            right: _bearVisible ? 0 : -MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.height * 0.05,
            curve: Curves.easeInOut,
            child: Assets.bearWelcome,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: Strings.continueTerms1, style: Styles.note()),
                      TextSpan(
                        text: Strings.termsOfUse,
                        style: Styles.note(
                            weight: FontWeight.w900, underline: true),
                        recognizer: TapGestureRecognizer()..onTap = () => LinkLauncher.openLink(WebLinks.termsUrl),
                      ),
                      TextSpan(
                        text: Strings.continueTerms2,
                        style: Styles.note(),
                      ),
                      TextSpan(
                        text: Strings.privacyPolicy,
                        style: Styles.note(
                            weight: FontWeight.w900, underline: true),
                        recognizer: TapGestureRecognizer()..onTap = () => LinkLauncher.openLink(WebLinks.privacyPolicyUrl)
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

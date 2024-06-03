import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleepy_bear/Enums/auth_mode.dart';
import 'package:sleepy_bear/UI/Buttons/input_button.dart';
import 'package:sleepy_bear/UI/Textfields/app_textformfield.dart';
import 'package:sleepy_bear/UI/wave_underline.dart';
import 'package:sleepy_bear/Values/AppColors.dart';
import 'package:sleepy_bear/Values/Assets.dart';
import 'package:sleepy_bear/Values/strings.dart';
import 'package:sleepy_bear/Values/styles.dart';

class EmailAuthModal extends StatefulWidget {
  final AuthMode authMode;

  EmailAuthModal({required this.authMode});

  @override
  State<StatefulWidget> createState() => _EmailAuthModalState();
}

class _EmailAuthModalState extends State<EmailAuthModal> {
  String _email = '';
  String _password = '';

  bool _passwordReset = false;

  void _emailChanged(String? val) {
    if (val == null) {
      return;
    }
    setState(() {
      _email = val;
    });
  }

  void _passwordChanged(String? val) {
    if (val == null) {
      return;
    }
    setState(() {
      _password = val;
    });
  }

  String get titleText {
    if(_passwordReset){return Strings.lostPassword;}
    if (widget.authMode == AuthMode.signUp) {
      return Strings.signUpNow;
    }
    return "${Strings.logIn}!";
  }

  String get message {
    if(_passwordReset){return Strings.passwordResetMessage;}

    if (widget.authMode == AuthMode.login) {
      return Strings.signInText;
    }
    return Strings.signUpText;
  }

  String get buttonText {
    if(_passwordReset){
      return Strings.resetPassword.toUpperCase();
    }

    String text = (widget.authMode == AuthMode.login) ? Strings.logIn : Strings.signUp;
    return text.toUpperCase();
  }

  Widget _backButton() {
    if (_passwordReset) {
      return IconButton(
          onPressed: () {
            setState(() {
              _passwordReset = false;
            });
          },
          icon: Assets.arrowLeftIcon);
    }
    return IconButton(
      icon: Assets.closeIcon,
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget _header() {
    Alignment align = (_passwordReset) ? Alignment.topLeft : Alignment.topRight;
    return Align(
      alignment: align,
      child: _backButton(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        Text(
          titleText,
          style: Styles.title(color: AppColors.formColor),
        ),
        Text(
          message,
          style: Styles.content(color: AppColors.formColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: AppTextField(
            label: Strings.emailAddress,
            onChanged: _emailChanged,
          ),
        ),
       if(!_passwordReset) AppTextField(
          label: Strings.password,
          obscure: true,
          onChanged: _passwordChanged,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
          child: FormButton(
            action: () {}, //TODO submit action
            title: buttonText,
            leftIcon: Assets.enterIcon,
          ),
        ),
       if(!_passwordReset) RichText(
          text: TextSpan(
              children: [
                TextSpan(
                  text: Strings.forgotPassword,
                  style: Styles.content(color: AppColors.formColor)
                ),
                WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: WaveUnderline(
                          text: Strings.getNewOne,
                          fontSize: 14,
                          callback: (){
                            setState(() {
                              _passwordReset = true;
                            });
                          }
                      ),
                    )
                )
          ]),
        )
      ],
    );
  }
}

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:sleepy_bear/Enums/auth_mode.dart';
import 'package:sleepy_bear/Helpers/alert_service.dart';
import 'package:sleepy_bear/Helpers/auth_service.dart';
import 'package:sleepy_bear/Helpers/connection_service.dart';
import 'package:sleepy_bear/Helpers/hud_helper.dart';
import 'package:sleepy_bear/Helpers/navigation_helper.dart';
import 'package:sleepy_bear/UI/Buttons/form_button.dart';
import 'package:sleepy_bear/UI/Textfields/app_textformfield.dart';
import 'package:sleepy_bear/UI/wave_underline.dart';
import 'package:sleepy_bear/Values/AppColors.dart';
import 'package:sleepy_bear/Values/Assets.dart';
import 'package:sleepy_bear/Values/strings.dart';
import 'package:sleepy_bear/Values/styles.dart';
import 'package:sprintf/sprintf.dart';

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

  final int _minPasswordLength = 8;

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

  // controls
  bool _allFilled(){
    if(_passwordReset){
      return _email.isNotEmpty;
    }
    return (_email.isNotEmpty && _password.isNotEmpty);
  }


  Future<bool> _inputControl() async{
    // filled check
    if(!_allFilled()){
      await AlertService.showAlert(Strings.inputsEmptyTitle, message:Strings.inputsEmptyMsg);
      return false;
    }

    // email check
    if(!EmailValidator.validate(_email)){
      await AlertService.showAlert(Strings.invalidEmailTitle, message:Strings.invalidEmailMsg);
      return false;
    }

    if(_passwordReset){return true;}

    // password check length
    if(_password.length < _minPasswordLength){
      String message = sprintf(Strings.shortPasswordMsg,[_minPasswordLength]);
      await AlertService.showAlert(Strings.shortPasswordTitle,  message:message);
      return false;
    }
    return true;
  }

  void _submitAction() async{
    final conn = await ConnectionService.isConnectionActive();
    if(!conn){
      await AlertService.showConnectionAlert();
      return;
    }
    final check = await _inputControl();
    if(!check){return;}
    HudHelper.showHud();
    if(_passwordReset){
     final res =  await AuthService.passwordReset(_email);
     HudHelper.dismissHud();
     if(res != null){
       await AlertService.showAlert(res);
     return;
     }
     await AlertService.showAlert(Strings.passwordResetSentTitle, message:Strings.passwordResetSentMsg);
     return;
    }else{
      final res = (widget.authMode == AuthMode.login) ? await AuthService.emailSignIn(_email, _password) : await AuthService.emailSignUp(_email,_password);
      HudHelper.dismissHud();
      if(res != null){
        await AlertService.showAlert(res);
        return;
      }
      NavigationHelper.openApp();
    }
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
            action: () =>_submitAction(),
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

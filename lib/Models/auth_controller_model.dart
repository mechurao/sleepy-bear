import 'package:flutter/material.dart';
import 'package:sleepy_bear/Helpers/alert_service.dart';
import 'package:sleepy_bear/Helpers/auth_service.dart';
import 'package:sleepy_bear/Helpers/connection_service.dart';
import 'package:sleepy_bear/Helpers/navigation_helper.dart';
import 'package:sleepy_bear/UI/Modals/bottom_sheet.dart';
import 'package:sleepy_bear/UI/Modals/controllers/email_auth_modal.dart';
import 'package:sleepy_bear/Values/screen_dimensions.dart';
import 'package:sleepy_bear/Values/strings.dart';

import '../Enums/auth_mode.dart';

class AuthControllerModel{

  AuthMode _authMode = AuthMode.login;

  AuthControllerModel();

  void appleAuth() async{
    final con = await ConnectionService.isConnectionActive();
    if(!con){
      await AlertService.showConnectionAlert();
      return;
    }
    final res = await AuthService.appleAuth();
    if(res != null){
      await AlertService.showAlert(res);
      return;
    }
    NavigationHelper.openApp();
  }

  void googleAuth() async{
    final con = await ConnectionService.isConnectionActive();
    if(!con){
      await AlertService.showConnectionAlert();
      return;
    }
    final res = await AuthService.googleAuth();
    if(res != null){
      debugPrint(res);
    }
    NavigationHelper.openApp();
  }

  void fbAuth() async{

  }

  void emailAuth() async{
    await ModalSheet.show(
        EmailAuthModal(authMode: _authMode,),
        handler: false,
      height: ScreenDimensions.getScreenHeight()*0.5
    );
  }


  void switchMode(){
    if(_authMode == AuthMode.login){
      _authMode = AuthMode.signUp;
      return;
    }
    _authMode = AuthMode.login;
  }

  // getters
  String get title{
    if(_authMode == AuthMode.signUp){return Strings.signUp;}
    return Strings.welcomeBack;
  }

  String get emailAuthTitle{
    if(_authMode == AuthMode.login){return Strings.emailSignIn;}
    return Strings.emailSignUp;
  }

  String get optionTitle{
    if(_authMode == AuthMode.login){return Strings.noAccount;}
    return Strings.alreadyHaveAccount;
  }

  String get switchModeTitle{
    if(_authMode == AuthMode.login){return Strings.signUp;}
    return Strings.logIn;
  }

  AuthMode get authMode{
    return _authMode;
  }


}
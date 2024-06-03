import 'package:sleepy_bear/Values/strings.dart';

import '../Enums/auth_mode.dart';

class AuthControllerModel{

  AuthMode _authMode = AuthMode.login;

  AuthControllerModel();

  void appleAuth(){

  }

  void googleAuth(){

  }

  void fbAuth(){

  }

  void emailAuth() async{


  }

  void _emailLogin(){

  }

  void _emailSignUp(){

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
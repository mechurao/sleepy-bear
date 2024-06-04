import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';

abstract class HudHelper{
  static void showHud(){
    SVProgressHUD.show();
  }

  static void dismissHud(){
    SVProgressHUD.dismiss();
  }
}
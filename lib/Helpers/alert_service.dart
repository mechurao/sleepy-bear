import 'package:flutter_platform_alert/flutter_platform_alert.dart';

import '../Values/strings.dart';

abstract class AlertService{
  static Future<void> showAlert(String title, {String? message}) async{

    final String messageText = (message != null) ? message : "";

    await FlutterPlatformAlert.showAlert(
        windowTitle: title,
        text: messageText
    );
  }

  static Future<void> showConnectionAlert() async{
    await showAlert(Strings.connectAlertTitle, message: Strings.connectAlertMsg);
  }

  static Future<void> showErrorAlert() async{
    await showAlert(Strings.errorOccuredTitle, message: Strings.errorOccuredMsg);
  }

  static Future<bool> showOptionAlert(String title, String msg, String confirmTitle) async{
    final result = await FlutterPlatformAlert.showCustomAlert(
        windowTitle: title,
        text: msg,
        positiveButtonTitle: confirmTitle,
        negativeButtonTitle: Strings.cancel
    );
    return (result == CustomButton.positiveButton);
  }

}
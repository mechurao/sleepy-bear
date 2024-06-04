import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:sleepy_bear/Helpers/alert_service.dart';
import 'package:sleepy_bear/Helpers/auth_service.dart';
import 'package:sleepy_bear/Helpers/connection_service.dart';
import 'package:sleepy_bear/Helpers/email_helper.dart';
import 'package:sleepy_bear/Helpers/hud_helper.dart';
import 'package:sleepy_bear/Helpers/link_launcher.dart';
import 'package:sleepy_bear/Helpers/navigation_helper.dart';
import 'package:sleepy_bear/UI/Modals/bottom_sheet.dart';
import 'package:sleepy_bear/UI/Modals/controllers/change_name_modal.dart';
import 'package:sleepy_bear/Values/strings.dart';
import 'package:sleepy_bear/Values/web_links.dart';

import '../Values/Assets.dart';


class SettingsControllerModel{
  SettingsControllerModel();

  void changeNameAction() async {

    await ModalSheet.show(const ChangeNameModal(),attachment: Positioned(
        top: -174,
        child: Assets.bearWave
    ),);

  }

  void logoutAction() async{
    final con = await ConnectionService.isConnectionActive();
    if(!con){
      await AlertService.showConnectionAlert();
      return;
    }
    final res = await AuthService.logout();
    if(res != null){
      await AlertService.showAlert(res);
      return;
    }
    NavigationHelper.openAuth();
  }

  void deleteAccountAction() async{
    final delete = await AlertService.showOptionAlert(Strings.deleteUserTitle, Strings.deleteUserMsg, Strings.delete);
    if(!delete){return;}
    final con = await ConnectionService.isConnectionActive();
    if(!con){
      await AlertService.showConnectionAlert();
      return;
    }
    HudHelper.showHud();
    final res = await AuthService.deleteUser();
    HudHelper.dismissHud();

    if(res != null){
      await AlertService.showAlert(res);
      return;
    }
    NavigationHelper.openAuth();
  }

  void tiktokAction (){
    LinkLauncher.openTikTok(WebLinks.tiktokUrl);
  }

  void youtubeAction() async{
    LinkLauncher.openYoutube(WebLinks.youtubeUrl);
  }

  void twitterAction(){
    LinkLauncher.openTwitter(WebLinks.twitterUrl);
  }

  void contactMeAction() async{
    await EmailHelper.openContactEmail();
  }

  void privacyPolicyAction() async{
    await LinkLauncher.openLink(WebLinks.privacyPolicyUrl);
  }

  void termsOfServiceAction() async{
    await LinkLauncher.openLink(WebLinks.termsUrl);
  }

}
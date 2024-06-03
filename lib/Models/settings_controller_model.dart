import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:sleepy_bear/Helpers/email_helper.dart';
import 'package:sleepy_bear/Helpers/link_launcher.dart';
import 'package:sleepy_bear/UI/Modals/bottom_sheet.dart';
import 'package:sleepy_bear/UI/Modals/controllers/change_name_modal.dart';
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

  void logoutAction(){}

  void deleteAccountAction(){}

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
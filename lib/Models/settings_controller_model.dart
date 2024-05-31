import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:sleepy_bear/Helpers/email_helper.dart';
import 'package:sleepy_bear/Helpers/link_launcher.dart';
import 'package:sleepy_bear/UI/Modals/controllers/change_name_modal.dart';
import 'package:sleepy_bear/Values/web_links.dart';


class SettingsControllerModel{
  SettingsControllerModel();

  void changeNameAction() async {
    await showModalBottomSheet(
      context: OneContext().context!,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ChangeNameModal();
      },
    );
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
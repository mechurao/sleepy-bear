import 'package:flutter/material.dart';
import 'package:sleepy_bear/Models/settings_controller_model.dart';
import 'package:sleepy_bear/UI/Buttons/settings_button.dart';
import 'package:sleepy_bear/UI/header.dart';
import 'package:sleepy_bear/Values/AppColors.dart';
import 'package:sleepy_bear/Values/Assets.dart';
import 'package:sleepy_bear/Values/strings.dart';
import 'package:sleepy_bear/Values/styles.dart';

class SettingsController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsControllerState();
}

class _SettingsControllerState extends State<SettingsController> {
  late SettingsControllerModel _model;

  @override
  void initState() {
    super.initState();
    _model = SettingsControllerModel();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(),
        Expanded(
          child: ListView(
            children: [
              _MenuGroup(
                title: Strings.yourAccount,
                children: [
                  SettingsButton(
                      text: Strings.changeYourNames,
                      icon: Assets.changeNameIcon,
                      action: () => _model.changeNameAction()),
                  const Divider(),
                  SettingsButton(
                      text: Strings.logOut,
                      icon: Assets.logoutIcon,
                      action: () => _model.logoutAction()),
                  const Divider(),
                  SettingsButton(
                      text: Strings.deleteYourAccount,
                      icon: Assets.deleteAccountIcon,
                      action: () => _model.deleteAccountAction())
                ],
              ),

              _MenuGroup(
                title: Strings.moreOfSleepyBear,
                  children: [
                    SettingsButton(
                        text: Strings.tiktokFollow,
                        icon: Assets.tiktokIcon,
                        action: () => _model.tiktokAction()
                    ),
                    const Divider(),
                    SettingsButton(
                        text: Strings.youtubeSubscribe,
                        icon: Assets.youtubeIcon,
                        action: () => _model.youtubeAction()
                    ),
                    const Divider(),
                    SettingsButton(
                        text: Strings.twitterFollow,
                        icon: Assets.twitterIcon,
                        action: () => _model.twitterAction()
                    ),
                    const Divider(),
                    SettingsButton(
                        text: Strings.contactMe,
                        icon: Assets.contactMeIcon,
                        action: () => _model.contactMeAction()
                    ),
                    const Divider(),
                    SettingsButton(
                        text: Strings.privacyPolicy,
                        icon: Assets.privacyPolicyIcon,
                        action: () => _model.privacyPolicyAction()
                    ),
                    const Divider(),
                    SettingsButton(
                        text: Strings.termsOfService,
                        icon: Assets.termsOfServiceIcon,
                        action: () => _model.termsOfServiceAction()
                    )
                  ],
              )

            ],
          ),
        ),
      ],
    );
  }
}

class _MenuGroup extends StatelessWidget {
  final List<Widget> children;
  final double _radius = 10;
  final double _padding = 15;
  final String title;

  const _MenuGroup({Key? key, required this.children, required this.title}) : super(key: key);

  Widget _sectionText(String text) {
    return Padding(
        padding: EdgeInsets.only(left: (_padding+10), top: 30, bottom: 5),
      child: Text(
        text,
        style: Styles.title(),
        textAlign: TextAlign.left,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        _sectionText(title),
        Container(
          margin:  EdgeInsets.symmetric(horizontal: _padding),
          decoration: BoxDecoration(
            color: AppColors.settingsButtonColor,
            borderRadius: BorderRadius.circular(_radius),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_radius),
            child: Column(
              children: children.map((child) {
                return Column(
                  children: [
                    child,
                  ],
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}

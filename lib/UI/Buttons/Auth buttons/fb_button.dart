import 'package:sleepy_bear/UI/Buttons/Auth%20buttons/social_button.dart';
import 'package:sleepy_bear/Values/AppColors.dart';
import 'package:sleepy_bear/Values/Assets.dart';
import 'package:sleepy_bear/Values/strings.dart';

class FacebookButton extends SocialButton{
  FacebookButton({
    super.key,
    required super.action
}):super(
    title: Strings.continueWithFb,
    color: AppColors.fbColor,
    leftIcon: Assets.facebookIcon
);
}
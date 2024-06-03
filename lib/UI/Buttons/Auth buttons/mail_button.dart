import 'package:sleepy_bear/UI/Buttons/Auth%20buttons/social_button.dart';
import 'package:sleepy_bear/Values/AppColors.dart';
import 'package:sleepy_bear/Values/Assets.dart';

class MailButton extends SocialButton{
  MailButton({
    super.key,
    required super.title,
    required super.action
}):super(
    color: AppColors.inputColor,
    leftIcon: Assets.mailIcon
);
}
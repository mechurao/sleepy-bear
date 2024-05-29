import 'package:sleepy_bear/UI/Buttons/Auth%20buttons/social_button.dart';
import 'package:sleepy_bear/Values/AppColors.dart';
import 'package:sleepy_bear/Values/strings.dart';
import '../../../Values/Assets.dart';

class AppleButton extends SocialButton{
  AppleButton({
    super.key,
    required super.action,
  }):super(
    title: Strings.continueWithApple,
    color: AppColors.appleColor,
    leftIcon: Assets.appleIcon
  );
}
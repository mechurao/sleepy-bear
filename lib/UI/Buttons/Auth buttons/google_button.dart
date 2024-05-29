import 'package:sleepy_bear/UI/Buttons/Auth%20buttons/social_button.dart';
import 'package:sleepy_bear/Values/AppColors.dart';
import 'package:sleepy_bear/Values/Assets.dart';

import '../../../Values/strings.dart';

class GoogleButton extends SocialButton{
  GoogleButton({super.key,
    required super.action
  }):super(
    title: Strings.continueWithGoogle,
    color: AppColors.googleColor,
    leftIcon: Assets.googleIcon
  );
}
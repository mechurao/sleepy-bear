import 'package:sleepy_bear/UI/Buttons/app_button.dart';
import 'package:sleepy_bear/Values/AppColors.dart';

class InputButton extends AppButton {
  InputButton({
    required super.action,
    required super.title,
    super.leftIcon,
    super.rightIcon,
  }) : super(
    color: AppColors.inputColor,
  );
}

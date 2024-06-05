import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:sleepy_bear/UI/Buttons/app_button.dart';
import 'package:sleepy_bear/Values/AppColors.dart';
import 'package:sleepy_bear/Values/config.dart';

class MainButton extends AppButton{
  MainButton({super.key,
    required super.action,
    required super.title,
    super.leftIcon,
    super.rightIcon,
  }):super(
    color: AppColors.inputColor,
    height: Config.mainInputHeight,
    style: GoogleFonts.nunito(
      fontWeight: FontWeight.w900,
      color: AppColors.defaultTextColor,
      fontSize: 20
    )
  );

}
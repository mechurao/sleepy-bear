import 'package:google_fonts/google_fonts.dart';
import 'package:sleepy_bear/UI/Buttons/app_button.dart';

abstract class SocialButton extends AppButton{
  SocialButton({super.key,
    required super.action,
    required super.title,
    required super.color,
    required super.leftIcon,
    super.titleColor
  }):super(
    fontFamily: GoogleFonts.roboto().fontFamily
  );

}
import 'package:flutter/material.dart';
import 'package:sleepy_bear/Values/dimensions.dart';

abstract class AppButton extends StatelessWidget {
  final Function() action;
  final String title;
  final Color color;
  final Color? titleColor;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final String? fontFamily;
  final double? height; // Přidán nový parametr

  const AppButton({
    super.key,
    required this.action,
    required this.title,
    required this.color,
    this.leftIcon,
    this.rightIcon,
    this.titleColor,
    this.fontFamily,
    this.height, 
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      fontSize: Dimensions.contentFontSize,
      color: titleColor ?? Colors.white,
      fontFamily: fontFamily,
    );

    return FractionallySizedBox(
      widthFactor: 0.8,
      child: ElevatedButton(
        onPressed: action,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          minimumSize: MaterialStateProperty.all<Size>(
            Size(double.infinity, height ?? 50.0),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leftIcon != null)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: leftIcon!,
              ),
            Text(
              title,
              style: textStyle,
            ),
            if (rightIcon != null)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: rightIcon,
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';


abstract class AppButton extends StatelessWidget{
  final Function() action;
  final String title;
  final Color color;
  final Image? leftIcon;
  final Image? rightIcon;


  const AppButton({
    super.key,
    required this.action,
    required this.title,
    required this.color,
    this.leftIcon,
    this.rightIcon
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: ElevatedButton(
      onPressed: action,
      style: ButtonStyle(
         backgroundColor: MaterialStateProperty.all<Color>(color),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(leftIcon != null) Padding(
              padding: const EdgeInsets.only(right: 10),
            child: leftIcon!,
          ),
          Text(title, style: const TextStyle(fontSize: 16),),
          if(rightIcon != null) Padding(
              padding: const EdgeInsets.only(left: 10),
            child: rightIcon,
          )
        ],
      )
    ),
    );
  }
}
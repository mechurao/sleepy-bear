import 'package:flutter/material.dart';
import 'package:sleepy_bear/Values/AppColors.dart';
import 'package:sleepy_bear/Values/styles.dart';

class SettingsButton extends StatelessWidget{
  final String text;
  final Widget icon;
  final Function() action;

  const SettingsButton({
    super.key,
    required this.text,
    required this.icon,
    required this.action,
  });

  @protected
  double height(){
    return 25;
  }


  @protected
  List<Widget> content(){
    return [
      icon,
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(text,style:  Styles.content(),),
      ),
      const Spacer(flex: 1,),
       Icon(Icons.arrow_forward_ios, color: AppColors.inputColor,)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: action,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: SizedBox(
              height: height(),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: content()
              ),
            )
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:sleepy_bear/Models/sleep_controller_model.dart';
import 'package:sleepy_bear/UI/Buttons/main_button.dart';
import 'package:sleepy_bear/UI/header.dart';
import 'package:sleepy_bear/UI/wave_underline.dart';
import 'package:sleepy_bear/Values/Assets.dart';
import 'package:sleepy_bear/Values/strings.dart';
import 'package:sleepy_bear/Values/styles.dart';

class SleepController extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SleepControllerState();

}

class _SleepControllerState extends State<SleepController>{

  late SleepControllerModel _model;

  @override
  void initState() {
    super.initState();
    _model = SleepControllerModel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(),
        RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: Strings.hello,
                  style: Styles.title()
                ),
                WidgetSpan(
                    child: WaveUnderline(
                      text: _model.displayName,
                      fontSize: Styles.title().fontSize!,
                      callback: (){},
                    )
                )
              ]
            )
        ),
        Text(Strings.welcomeText, style: Styles.content(),),

        const Spacer(flex: 1,),
        Stack(
          clipBehavior: Clip.none,
          children: [
            MainButton(
              action: () => _model.startAction(),
              title: Strings.startNow,
              rightIcon: Assets.startIcon,
            ),
            Positioned(
                top: -124,
                child: Assets.bearWave
            ),
          ],
        )
        
      ],

    );
  }

}
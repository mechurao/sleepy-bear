import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sleepy_bear/UI/Buttons/input_button.dart';
import 'package:sleepy_bear/UI/Textfields/app_textformfield.dart';
import '../../../Values/AppColors.dart';
import '../../../Values/Assets.dart';
import '../../../Values/screen_dimensions.dart';
import '../../../Values/strings.dart';
import '../../../Values/styles.dart';

class ChangeNameModal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChangeNameModalState();
}

class _ChangeNameModalState extends State<ChangeNameModal> {

String _childName = '';
String _parentName = '';

void _childNameChanged(String? val){
  if(val == null){return;}
  _childName = val;
}

void _parentNameChanged(String? val){
  if(val == null){return;}
  _parentName = val;
}


  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -174,
          child: Assets.bearWave,
        ),
        SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            width: ScreenDimensions.getScreenWidth() * 0.9,
            height: 340,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Strings.changeNames,
                  style: Styles.title(color: AppColors.formButtonColor),
                ),
                Text(
                  Strings.changeNamesMessage,
                  style: Styles.content(color: AppColors.formButtonColor),
                ),
                 Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 9),
                  child: AppTextformField(label: Strings.childsName, onSaved: (val) => _childNameChanged,),
                ),
                 AppTextformField(label: Strings.parentsName, onSaved: (val) => _parentNameChanged,),
                const Spacer(flex: 1,),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Assets.privacyBlueIcon,
                        ),
                      ),
                      TextSpan(
                        text: Strings.shareDisclaimer,
                        style: Styles.note(
                          color: AppColors.formButtonColor,
                          italic: true,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 1,),
                Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                  child: InputButton(action: (){}, title: Strings.update, leftIcon: Assets.checkboxIcon,),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

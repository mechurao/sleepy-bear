import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleepy_bear/UI/Buttons/input_button.dart';
import 'package:sleepy_bear/UI/Textfields/app_textformfield.dart';
import '../../../Values/AppColors.dart';
import '../../../Values/Assets.dart';
import '../../../Values/screen_dimensions.dart';
import '../../../Values/strings.dart';
import '../../../Values/styles.dart';

class ChangeNameModal extends StatefulWidget {
  const ChangeNameModal({super.key});

  @override
  State<StatefulWidget> createState() => _ChangeNameModalState();
}

class _ChangeNameModalState extends State<ChangeNameModal> {
  String _childName = '';
  String _parentName = '';

  void _childNameChanged(String? val) {
    if (val == null) {
      return;
    }
    setState(() {
      _childName = val;
    });
  }

  void _parentNameChanged(String? val) {
    if (val == null) {
      return;
    }
    setState(() {
      _parentName = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          Strings.changeNames,
          style: Styles.title(color: AppColors.formColor),
        ),
        Text(
          Strings.changeNamesMessage,
          style: Styles.content(color: AppColors.formColor),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 9),
          child: AppTextField(
            label: Strings.childsName,
            onChanged: _childNameChanged,
          ),
        ),
        AppTextField(
          label: Strings.parentsName,
          onChanged: _parentNameChanged,
        ),
        const SizedBox(height: 20),
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
                  color: AppColors.formColor,
                  italic: true,
                  size: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: FormButton(
            action: () {},
            title: Strings.update,
            leftIcon: Assets.checkboxIcon,
          ),
        ),
      ],
    );
  }
}

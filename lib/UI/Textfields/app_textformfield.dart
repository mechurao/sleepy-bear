import 'package:flutter/material.dart';
import 'package:sleepy_bear/Values/AppColors.dart';

class AppTextformField extends StatefulWidget {
  final String label;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final bool? obscure;
  final TextInputType? inputType;

  const AppTextformField({
    Key? key,
    required this.label,
    this.validator,
    this.onSaved,
    this.obscure = false,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  _AppTextformFieldState createState() => _AppTextformFieldState();
}

class _AppTextformFieldState extends State<AppTextformField> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  double _radius = 15;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController();

    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: TextFormField(
        controller: _controller,
        focusNode: _focusNode,
        decoration: InputDecoration(
          hintText: widget.label,
          filled: true,
          border: InputBorder.none,
          fillColor: AppColors.inputColor.withOpacity(0.25),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_radius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_radius),
            borderSide: BorderSide.none,
          ),
        ),
        validator: widget.validator,
        onSaved: widget.onSaved,
        textInputAction: TextInputAction.done,
        enableSuggestions: false,
        autocorrect: false,
        obscureText: widget.obscure!,
        keyboardType: widget.inputType,
        onFieldSubmitted: (value) {
          _focusNode.unfocus();
        },
      ),
    );
  }
}

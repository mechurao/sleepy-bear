import 'package:flutter/material.dart';
import 'package:sleepy_bear/Values/AppColors.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final bool? obscure;
  final TextInputType? inputType;
  final Function(String)? onChanged;
  final Color? fillColor;

  const AppTextField({
    super.key,
    required this.label,
    this.obscure = false,
    this.inputType = TextInputType.text,
    this.onChanged,
    this.fillColor,
  });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  final double _radius = 15;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController();

    _controller.addListener(() {
      widget.onChanged?.call(_controller.text);
    });

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
    // Default fillColor if not provided
    final fillColor = widget.fillColor ?? AppColors.inputColor.withOpacity(0.25);

    return FractionallySizedBox(
      widthFactor: 0.8,
      child: Container(
        height: 50,
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: widget.label,
            filled: true,
            fillColor: fillColor,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_radius),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(_radius),
              borderSide: BorderSide.none,
            ),
          ),
          textInputAction: TextInputAction.done,
          enableSuggestions: false,
          autocorrect: false,
          obscureText: widget.obscure!,
          keyboardType: widget.inputType,
          onSubmitted: (value) {
            _focusNode.unfocus();
          },
        ),
      ),
    );
  }
}

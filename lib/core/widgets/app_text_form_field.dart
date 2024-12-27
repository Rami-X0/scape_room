import 'package:flutter/material.dart';
import 'package:scape_room/core/helper/extension.dart';
import 'package:scape_room/core/theming/app_colors.dart';
import 'package:scape_room/core/theming/font_weight_helper.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final double? elevation;
  final Color? shadowColor;
  final bool? obscureText;
  final int? maxLines;
  final Function(String?) validator;
  final TextEditingController? controller;
  final Color? fillColor;
  final TextInputType? keyboardType;

  const AppTextFormField({
    super.key,
    required this.hintText,
    required this.suffixIcon,
    this.contentPadding,
    this.obscureText,
    required this.validator,
    required this.controller,
    this.fillColor,
    this.borderRadius,
    this.elevation,
    this.shadowColor,
    this.keyboardType,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines:maxLines?? 3,
      minLines: 1,
      style: const TextStyle(
        fontWeight: FontWeightHelper.medium,
      ),
      keyboardType: keyboardType,
      validator: (value) {
        return validator(value);
      },
      controller: controller,
      obscureText: obscureText ?? false,
      cursorOpacityAnimates: true,
      decoration: _textFormFiledDecoration(context),
    );
  }

  InputDecoration _textFormFiledDecoration(BuildContext context) {
    return InputDecoration(
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(
            vertical: 17,
            horizontal: 20,
          ),
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(borderRadius ?? context.width * 0.02),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1.3,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(borderRadius ?? context.width * 0.02),
        borderSide: const BorderSide(
          color: AppColors.defaultColor,
          width: 1.3,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(borderRadius ?? context.width * 0.02),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.3,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(borderRadius ?? context.width * 0.02),
        borderSide: const BorderSide(color: Colors.red, width: 1.3),
      ),
      suffixIcon: Padding(
        padding: EdgeInsets.all(context.height * 0.02),
        child: suffixIcon,
      ),
      isDense: true,
      filled: true,
      fillColor: fillColor ?? Colors.white,
    );
  }
}

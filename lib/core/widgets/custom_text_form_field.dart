import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, this.suffixIcon,
    this.textInputType = TextInputType.text});
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText.tr(),
        hintStyle: TextStyles.bold13.copyWith(color: AppColors.gray400),
        suffixIcon: suffixIcon
      ),
      
    );
  }
}
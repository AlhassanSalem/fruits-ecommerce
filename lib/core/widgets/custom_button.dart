import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.style,
    this.backgroundColor,
    this.radius,
    this.padding,
  });
  final String title;
  final VoidCallback? onPressed;
  final TextStyle? style;
  final Color? backgroundColor;
  final double? radius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 16),
        ),
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Text(
          title.tr(),
          style: style ?? TextStyles.bold16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

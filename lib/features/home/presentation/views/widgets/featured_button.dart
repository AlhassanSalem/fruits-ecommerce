import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:ecommerce_fruits/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class FeaturedButton extends StatelessWidget {
  const FeaturedButton({super.key, this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: FittedBox(
        child: CustomButton(
          onPressed: onPressed,
          title: 'تسوق الان',
          style: TextStyles.bold13.copyWith(color: AppColors.darkPrimary),
          backgroundColor: Colors.white,
          radius: 4,
          padding: EdgeInsets.symmetric(horizontal: 28),
        ),
      ),
    );
  }
}

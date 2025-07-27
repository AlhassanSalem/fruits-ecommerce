import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTabIndicator extends StatelessWidget {
  const CustomTabIndicator({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: List.generate(2, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 12),
          width: index == currentIndex ? 11 : 9,
          height: index == currentIndex ? 11 : 9,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentIndex 
            ? AppColors.primary 
            : AppColors.primary.withOpacity(0.5),
          ),
        );
      }),
    );
  }
}
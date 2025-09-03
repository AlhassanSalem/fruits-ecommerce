import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:ecommerce_fruits/features/main/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActiveBottomNavigationBarItem extends StatelessWidget {
  final BottomNavigationBarEntity item;

  const ActiveBottomNavigationBarItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: ShapeDecoration(
                color: AppColors.darkPrimary,
                shape: CircleBorder(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: SvgPicture.asset(item.activeIcon),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              item.label.tr(),
              style: TextStyles.semiBold11.copyWith(color: AppColors.primary),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

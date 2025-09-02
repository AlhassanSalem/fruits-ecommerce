import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/routing/routes.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(LocaleKeys.bestSelling.tr(), style: TextStyles.bold16),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.bestSellingView);
          },
          child: Text(
            LocaleKeys.seeMore.tr(),
            style: TextStyles.regular13.copyWith(color: AppColors.gray400),
          ),
        ),
      ],
    );
  }
}

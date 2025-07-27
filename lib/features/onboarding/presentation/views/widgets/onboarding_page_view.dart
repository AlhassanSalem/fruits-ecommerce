import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/utils/app_assets.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/helper/spacing.dart';
import 'package:ecommerce_fruits/core/helper/page_view_item.dart';
import 'package:flutter/material.dart';


class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key, required this.pageController});
  final PageController pageController;


  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(LocaleKeys.welcomeTo.tr(), style: TextStyles.bold23.copyWith(color: AppColors.grey950),),
              horizontalSpacing(4),
              Text(LocaleKeys.fruits.tr(), style: TextStyles.bold23.copyWith(color: AppColors.primary),),
              Text(LocaleKeys.hub.tr(), style: TextStyles.bold23.copyWith(color: AppColors.secondary),),
            ],
          ),
          subtitle: LocaleKeys.onboardingSubtitle1,
          imagePath: Assets.imagesFruitBasket,
          backgroundImagePath: Assets.imagesOrangeBackground,
        ),
        PageViewItem(
          isVisible: false,
          title: Text(LocaleKeys.searchAndShop.tr(), style: TextStyles.bold23.copyWith(color: AppColors.grey950),),
          subtitle: LocaleKeys.onboardingSubtitle2,
          imagePath: Assets.imagesPineapple,
          backgroundImagePath: Assets.imagesGreenBackground,
        ),
        
      ],
    );
  }
}


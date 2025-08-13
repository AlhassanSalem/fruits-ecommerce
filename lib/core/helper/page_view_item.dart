import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/shared_pref_helper.dart';
import 'package:ecommerce_fruits/core/routing/routes.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:ecommerce_fruits/core/helper/extensions.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.backgroundImagePath,
    this.isVisible = true,
  });
  final Widget title;
  final String subtitle;
  final String imagePath;
  final String backgroundImagePath;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImagePath, 
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  imagePath,
                ),
              ),
              Visibility(
                visible: isVisible,
                child: PositionedDirectional(
                  top: 0,
                  start: 0,
                  child: GestureDetector(
                    onTap: () => _navigateToOnSignInView(context),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 30, top: 39),
                      child: Text(LocaleKeys.skip.tr(), style: TextStyles.regular13.copyWith(color: AppColors.gray400),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpacing(47),
        title,
        Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 37.0,
            end: 37.0,
            top: 24.0,
          ),
          child: Text(
            subtitle.tr(),
            style: TextStyles.semiBold13.copyWith(color: AppColors.gray500),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  /// Navigates to the SignIn view and marks the OnBoarding view as seen.
  void _navigateToOnSignInView(BuildContext context) {
    SharedPrefHelper().setValueForKey(
      key: SharedPrefKeys.isOnBoardingViewSeen,
      value: true,
    );
    context.pushReplacementNamed(Routes.signInView);
  }
}








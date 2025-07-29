import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/routing/routes.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: LocaleKeys.dontHaveAccount.tr(),
                    style: TextStyles.semiBold16.copyWith(color: AppColors.gray400),
                  ),
                  TextSpan(
                    text: ' ',
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, Routes.signUpView);
                      },
                    text: LocaleKeys.createOne.tr(),
                    style: TextStyles.semiBold16.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
           );
  }
}
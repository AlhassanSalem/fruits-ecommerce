import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/extensions.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${LocaleKeys.alreadyHaveAnAccount.tr()} ',
              style: TextStyles.semiBold16.copyWith(color: AppColors.gray400),
            ),
            TextSpan(
              text: LocaleKeys.login.tr(),
              style: TextStyles.semiBold16.copyWith(color: AppColors.darkPrimary),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pop();
                },
            ),
          ]
        )
      ),
    );
  }
}
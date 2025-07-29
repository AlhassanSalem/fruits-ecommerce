import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/constants.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/helper/spacing.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  State<TermsAndConditionsWidget> createState() => _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCheckbox(
              isChecked: isTermsAccepted,
              onChanged: (value) {
                setState(() {
                  isTermsAccepted = value;
                });
              },
            ),
            horizontalSpacing(16),
            Expanded(
              child: Text.rich(
                TextSpan(
                      children: [
                        TextSpan(
              text:  '${LocaleKeys.byCreatingAnAccountYouAgreeTo.tr()} ',
              style: TextStyles.semiBold13.copyWith(color: AppColors.gray400),
                        ),
                        TextSpan(
              text:  LocaleKeys.termsAndConditions.tr(),
              style: TextStyles.semiBold13.copyWith(color: AppColors.lightPrimary),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
            ),
          ],
        );
  }
}


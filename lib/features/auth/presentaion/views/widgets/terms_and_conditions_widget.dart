import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/helper/spacing.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/cubits/signup/signup_cubit.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCheckbox(
              isChecked: context.watch<SignupCubit>().state.isTermsAccepted,
              onChanged: (value) {
                context.read<SignupCubit>().toggleTermsAccepted();
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


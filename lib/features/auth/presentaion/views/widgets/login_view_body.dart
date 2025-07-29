import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/constants.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/helper/spacing.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:ecommerce_fruits/core/widgets/custom_button.dart';
import 'package:ecommerce_fruits/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/widgets/dont_have_account_widget.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/widgets/or_divider_widget.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/widgets/social_login_list.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpacing(24),
            CustomTextFormField(
              hintText: LocaleKeys.email,
              textInputType: TextInputType.emailAddress,
            ),
            verticalSpacing(kVerticalPadding),
            CustomTextFormField(
              hintText: LocaleKeys.password, 
              textInputType: TextInputType.visiblePassword,
            ),
            verticalSpacing(kVerticalPadding),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                LocaleKeys.forgotPassword.tr(),
                style: TextStyles.semiBold13.copyWith(color: AppColors.lightPrimary),
              ),
            ),
            verticalSpacing(33),
            CustomButton(title: LocaleKeys.login, onPressed: () {}),
            verticalSpacing(33),
            const DontHaveAccountWidget(),
            verticalSpacing(37),
            const OrDividerWidget(),
            verticalSpacing(kVerticalPadding),
            const SocialLoginList(),
          ],
        ),
      ),
    );
  }
}




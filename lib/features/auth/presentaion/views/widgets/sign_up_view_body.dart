import 'package:ecommerce_fruits/core/helper/constants.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/helper/spacing.dart';
import 'package:ecommerce_fruits/core/widgets/custom_button.dart';
import 'package:ecommerce_fruits/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/widgets/have_account_widget.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/widgets/terms_and_conditions_widget.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacing(kVerticalPadding),
            CustomTextFormField(
              hintText: LocaleKeys.fullName,
            ),
            verticalSpacing(kVerticalPadding),
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
            const TermsAndConditionsWidget(),
            verticalSpacing(30),
            CustomButton(title: LocaleKeys.createNewAccount, onPressed: () {}),
            verticalSpacing(26),
            const HaveAccountWidget(),
          ],
        ),
      ),
    );
  }
}
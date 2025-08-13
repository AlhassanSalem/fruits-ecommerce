import 'package:ecommerce_fruits/core/helper/constants.dart';
import 'package:ecommerce_fruits/core/helper/spacing.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/widgets/have_account_widget.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/widgets/signup_button_bloc_consumer.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/widgets/signup_form.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/widgets/terms_and_conditions_widget.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});
   

  @override
  Widget build(BuildContext context) {
    bool isAcceptedTermsAndConditions = false;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacing(16),
            const SignupForm(),
            verticalSpacing(16),
            const TermsAndConditionsWidget(),
            verticalSpacing(30),
            SignupButtonBlocConsumer(
              isAcceptedTermsAndConditions: isAcceptedTermsAndConditions,
            ),
            verticalSpacing(26),
            const HaveAccountWidget(),
          ],
        ),
      ),
    );
  } 
}
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/app_regex.dart';
import 'package:ecommerce_fruits/core/helper/extensions.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/helper/spacing.dart';
import 'package:ecommerce_fruits/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/cubits/signin/signin_cubit.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signinCubit = context.read<SigninCubit>();
    return Form(
      key: signinCubit.signinFormKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: signinCubit.emailController,
            hintText: LocaleKeys.email,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value.isNullOrEmpty) {
                return LocaleKeys.pleaseEnterYourEmail.tr();
              } else if (!AppRegex.isValidEmail(value!)) {
                return LocaleKeys.errorValidEmail.tr();
              }
              return null;
            },
          ),
          verticalSpacing(16),
          PasswordField(controller: signinCubit.passwordController),
        ],
      ),
    );
  }
}

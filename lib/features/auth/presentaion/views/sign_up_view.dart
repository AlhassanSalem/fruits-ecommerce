import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: LocaleKeys.createAccount),
      body: const SignUpViewBody(),
    );
  }
}
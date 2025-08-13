import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/widgets/signin_view_body.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title : LocaleKeys.login),
      body: const SignInViewBody(),
    );
  }

  
}
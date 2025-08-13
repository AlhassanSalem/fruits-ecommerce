import 'dart:io';

import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/helper/spacing.dart';
import 'package:ecommerce_fruits/core/utils/app_assets.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/cubits/signin/signin_cubit.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialSignInMethods extends StatelessWidget {
  const SocialSignInMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialLoginButton(
          imagePath: Assets.imagesGoogleIcon,
          title: LocaleKeys.signInWithGoogle,
          onTap: () {
            context.read<SigninCubit>().signInWithGoogle();
          },
        ),
        verticalSpacing(16),
        Visibility(
          visible: Platform.isIOS,
          replacement: SizedBox.shrink(),
          child: Column(
            children: [
              SocialLoginButton(
                imagePath: Assets.imagesAppleIcon,
                title: LocaleKeys.signInWithApple,
                onTap: () {
                  // context.read<SigninCubit>().signInWithApple();
                },
              ),
              verticalSpacing(16),
            ],
          ),
        ),
        SocialLoginButton(
          imagePath: Assets.imagesFacebookIcon,
          title: LocaleKeys.signInWithFacebook,
          onTap: () {
            context.read<SigninCubit>().signInWithFacebook();
          },
        ),
      ],
    );
  }
}

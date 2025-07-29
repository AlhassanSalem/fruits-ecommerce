import 'package:ecommerce_fruits/core/helper/constants.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/utils/app_assets.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';

class SocialLoginList extends StatelessWidget {
  const SocialLoginList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        socialLoginDataList.length,
        (int index) {
          final socialData = socialLoginDataList[index];
          return Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: index != socialLoginDataList.length - 1
              ? kVerticalPadding
              : 0,
            ),
            child: SocialLoginButton(
              imagePath: socialData.imagePath,
              title: socialData.title,
            ),
          );
        },
      ),
    );
  }
}



class SocialData {
  final String imagePath;
  final String title;

  SocialData({required this.imagePath, required this.title});
}

List<SocialData> socialLoginDataList = [
  SocialData(imagePath: Assets.imagesGoogleIcon, title: LocaleKeys.signInWithGoogle),
  SocialData(imagePath: Assets.imagesAppleIcon, title: LocaleKeys.signInWithApple),
  SocialData(imagePath: Assets.imagesFacebookIcon, title: LocaleKeys.signInWithFacebook),
];
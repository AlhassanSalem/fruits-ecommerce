import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/spacing.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginButton extends StatelessWidget {
  const  SocialLoginButton({super.key, required this.imagePath, required this.title});
  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsetsDirectional.only(start: 17, top: 17, bottom: 17,),
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
       border: Border.all(color: Color(0xFFDDDFDF)),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            imagePath,
          ),
          horizontalSpacing(53),
          Text(
            title.tr(),
            style: TextStyles.semiBold16,
          ),
        ],
      ),
    );
  }
}
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/helper/spacing.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            height: 1,
            color: Color(0xFFDDDFDF),
          ),
        ),
        horizontalSpacing(18),
        Text(LocaleKeys.or.tr(),style: TextStyles.semiBold16),
        horizontalSpacing(18),
        Expanded(
          child: Divider(
            
            height: 1,
            color: Color(0xFFDDDFDF),
          ),
        ),
      ],
    );
  }
}
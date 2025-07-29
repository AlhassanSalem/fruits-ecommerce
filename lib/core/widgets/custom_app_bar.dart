import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/extensions.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, {required String title}) {
    return AppBar(
      leading: IconButton(
        onPressed: ()=> context.pop(),
        icon: const Icon(Icons.arrow_back_ios),
      ),
      centerTitle: true,
      title: Text(
        title.tr(),
        style: TextStyles.bold19.copyWith(color:AppColors.grey950),
       ),
    );
  }
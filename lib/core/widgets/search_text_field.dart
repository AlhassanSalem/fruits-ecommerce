import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/utils/app_assets.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: LocaleKeys.searchFor.tr(),
          hintStyle: TextStyles.regular13.copyWith(color: AppColors.gray400),
          suffixIcon: SvgPicture.asset(
            Assets.imagesFilter,
            fit: BoxFit.scaleDown,
          ),
          prefixIcon: SvgPicture.asset(
            Assets.imagesSearch,
            fit: BoxFit.scaleDown,
          ),
          fillColor: Colors.white,
          filled: true,
          border: outlineInputBuilder(),
          focusedBorder: outlineInputBuilder(),
          enabledBorder: outlineInputBuilder(),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBuilder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}

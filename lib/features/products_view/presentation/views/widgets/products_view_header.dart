import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/utils/app_assets.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productsLength});
  final int productsLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$productsLength ${LocaleKeys.results.tr()}',
          style: TextStyles.bold16,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xFFCACECE)),
          ),
          child: SvgPicture.asset(Assets.imagesFilter2),
        ),
      ],
    );
  }
}

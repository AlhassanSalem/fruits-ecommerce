import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });
  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(start: 28, top: 12, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFF1F1F5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.bold16.copyWith(color: Color(0xFF23AA49)),
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyles.semiBold13.copyWith(color: Color(0xFF979899)),
              ),
            ],
          ),
          SizedBox(width: 16),
          SvgPicture.asset(image),
        ],
      ),
    );
  }
}

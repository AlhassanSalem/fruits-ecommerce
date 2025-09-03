import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProductDetailsHeaderSection extends StatelessWidget {
  const ProductDetailsHeaderSection({
    super.key,
    required this.price,
    required this.name,
  });

  final num price;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '$price جنية ',
              style: TextStyles.bold13.copyWith(color: AppColors.secondary),
            ),
            TextSpan(
              text: ' / ',
              style: TextStyles.semiBold13.copyWith(
                color: AppColors.lightSecondary,
              ),
            ),
            TextSpan(
              text: 'الكيلو',
              style: TextStyles.semiBold11.copyWith(
                color: AppColors.lightSecondary,
              ),
            ),
          ],
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primary,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, color: Colors.white),
            ),
          ),
          SizedBox(width: 16),
          Text('4', style: TextStyles.bold16),
          SizedBox(width: 16),
          CircleAvatar(
            backgroundColor: Color(0xFFF3F5F7),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
          ),
        ],
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/entities/product_entity.dart';
import 'package:ecommerce_fruits/core/entities/review_entity.dart';
import 'package:ecommerce_fruits/core/helper/constants.dart';
import 'package:ecommerce_fruits/core/helper/extensions.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/routing/routes.dart';
import 'package:ecommerce_fruits/core/utils/app_assets.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:ecommerce_fruits/core/widgets/custom_button.dart';
import 'package:ecommerce_fruits/features/products_view/presentation/views/widgets/product_details_grid_view.dart';
import 'package:ecommerce_fruits/features/products_view/presentation/views/widgets/product_details_header_section.dart';
import 'package:ecommerce_fruits/features/products_view/presentation/views/widgets/product_details_image_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProductDetailsImageSection(productImage: product.imageUrl!),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: Column(
                children: [
                  ProductDetailsHeaderSection(
                    name: product.name,
                    price: product.price,
                  ),
                  RatingReviewsRow(
                    rating: product.avgRating,
                    reviews: product.reviews,
                  ),
                  SizedBox(height: 20),
                  Text(
                    product.description,
                    style: TextStyles.regular13.copyWith(
                      color: Color(0xFF979899),
                    ),
                  ),
                  SizedBox(height: 16),
                  ProductDetailsGridView(product: product),
                  SizedBox(
                    height: 54,
                    width: double.infinity,
                    child: CustomButton(title: LocaleKeys.addToCart),
                  ),
                  SizedBox(height: 36),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RatingReviewsRow extends StatelessWidget {
  const RatingReviewsRow({
    super.key,
    required this.rating,
    required this.reviews,
  });

  final num rating;
  final List<ReviewEntity> reviews;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesStar, height: 16, width: 16),
        SizedBox(width: 4),
        Text('${getAverageRating(reviews)} (${reviews.length})'),
        SizedBox(width: 4),
        GestureDetector(
          onTap: () =>
              context.pushNamed(Routes.reviewsView, arguments: reviews),
          child: Text(
            LocaleKeys.reviews.tr(),
            style: TextStyles.bold13.copyWith(
              color: AppColors.darkPrimary,
              decorationStyle: TextDecorationStyle.solid,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.darkPrimary,
              decorationThickness: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

num getAverageRating(List<ReviewEntity> reviews) {
  if (reviews.isEmpty) return 0;

  num totalRating = 0;
  for (var review in reviews) {
    totalRating += review.ratting;
  }
  return totalRating / reviews.length;
}

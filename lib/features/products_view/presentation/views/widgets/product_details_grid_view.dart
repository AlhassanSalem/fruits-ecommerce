import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/entities/product_entity.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/utils/app_assets.dart';
import 'package:ecommerce_fruits/features/products_view/domain/entities/product_details_entity.dart';
import 'package:ecommerce_fruits/features/products_view/presentation/views/widgets/product_details_card.dart';
import 'package:flutter/cupertino.dart';

class ProductDetailsGridView extends StatefulWidget {
  const ProductDetailsGridView({super.key, required this.product});

  final ProductEntity product;

  @override
  State<ProductDetailsGridView> createState() => _ProductDetailsGridViewState();
}

class _ProductDetailsGridViewState extends State<ProductDetailsGridView> {
  @override
  Widget build(BuildContext context) {
    List<ProductDetail> productDetails = [
      ProductDetail(
        title: widget.product.expirationsMonths.toString(),
        subtitle: LocaleKeys.expiration.tr(),
        image: Assets.imagesExpiration,
      ),
      ProductDetail(
        title: widget.product.isOrganic ? '100%' : '0%',
        subtitle: LocaleKeys.organic.tr(),
        image: Assets.imagesOrganic,
      ),
      ProductDetail(
        title: '${widget.product.numberOfCalories} ${LocaleKeys.calories.tr()}',
        subtitle: '${widget.product.unitAmount} ${LocaleKeys.gram.tr()}',
        image: Assets.imagesCalories,
      ),
      ProductDetail(
        title: '${widget.product.avgRating} (${widget.product.ratingCount})',
        subtitle: LocaleKeys.reviews.tr(),
        image: Assets.imagesStar,
      ),
    ];
    return AspectRatio(
      aspectRatio: 163 / 100,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: productDetails.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 80,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final detail = productDetails[index];
          return ProductDetailsCard(
            title: detail.title,
            subtitle: detail.subtitle,
            image: detail.image,
          );
        },
      ),
    );
  }
}

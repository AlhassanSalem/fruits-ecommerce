import 'package:ecommerce_fruits/core/helper/extensions.dart';
import 'package:ecommerce_fruits/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class ProductDetailsImageSection extends StatelessWidget {
  const ProductDetailsImageSection({super.key, required this.productImage});

  final String productImage;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.imagesProductDetailsBackground),
                    fit: BoxFit.fill,
                  ),
                ),
                child: SizedBox(
                  height: 100,
                  child: Image.network(productImage),
                ),
              ),
            ),
            PositionedDirectional(
              top: 16,
              start: 16,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new),
                  onPressed: () => context.pop(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

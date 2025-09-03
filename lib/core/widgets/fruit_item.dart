import 'package:ecommerce_fruits/core/entities/product_entity.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:ecommerce_fruits/core/widgets/custom_networking_image.dart';
import 'package:ecommerce_fruits/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: Color(0xFFF3F5F7),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border_outlined),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 20),
                Flexible(
                  child: CustomNetworkingImage(imageUrl: product.imageUrl!),
                ),
                SizedBox(height: 24),
                ListTile(
                  title: Text(product.name, style: TextStyles.semiBold13),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${product.price}جنية ',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.secondary,
                          ),
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
                  trailing: CircleAvatar(
                    backgroundColor: AppColors.darkPrimary,
                    child: IconButton(
                      onPressed: () {
                        context.read<CartCubit>().addProductToCart(product);
                      },
                      icon: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

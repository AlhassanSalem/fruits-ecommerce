import 'package:ecommerce_fruits/core/utils/app_assets.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:ecommerce_fruits/core/widgets/custom_networking_image.dart';
import 'package:ecommerce_fruits/features/cart/domain/entities/cart_item_entity.dart';
import 'package:ecommerce_fruits/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_fruits/features/cart/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:ecommerce_fruits/features/cart/presentation/views/widgets/cart_item_action_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});
  final CartItemEntity cartItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) =>
          current is CartItemUpdated && current.cartItem == cartItem,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                width: 72,
                height: 92,
                color: Color(0xFFF3F5F7),
                child: CustomNetworkingImage(
                  imageUrl: cartItem.product.imageUrl!,
                ),
              ),
              const SizedBox(width: 17),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(cartItem.product.name, style: TextStyles.bold13),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => context
                              .read<CartCubit>()
                              .removeProductFromCart(cartItem),
                          child: SvgPicture.asset(Assets.imagesTrash),
                        ),
                      ],
                    ),
                    Text(
                      '${cartItem.calculateTotalWeight()} كجم',
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        CartItemActionButtons(cartItem: cartItem),
                        Spacer(),
                        Text(
                          '${cartItem.calculateTotalPrice()} جنيه ',
                          style: TextStyles.bold16.copyWith(
                            color: AppColors.secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

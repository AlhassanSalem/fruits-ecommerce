import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:ecommerce_fruits/features/cart/domain/entities/cart_item_entity.dart';
import 'package:ecommerce_fruits/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_fruits/features/cart/presentation/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItem});
  final CartItemEntity cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          icon: Icons.add,
          onPressed: () {
            cartItem.increaseQuantity();
            context.read<CartItemCubit>().updateCartItem(cartItem);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('${cartItem.quantity}', style: TextStyles.bold16),
        ),
        CartItemActionButton(
          icon: Icons.remove,
          backgroundColor: Color(0xFFF3F5F7),
          iconColor: AppColors.gray400,
          onPressed: () {
            cartItem.decreaseQuantity();
            if (cartItem.quantity == 0) {
              context.read<CartCubit>().removeProductFromCart(cartItem);
            } else {
              context.read<CartItemCubit>().updateCartItem(cartItem);
            }
          },
        ),
      ],
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({
    super.key,
    this.backgroundColor,
    this.iconColor,
    required this.icon,
    this.onPressed,
  });
  final Color? backgroundColor;
  final Color? iconColor;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        radius: 12,
        backgroundColor: backgroundColor ?? AppColors.primary,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: FittedBox(child: Icon(icon, color: iconColor ?? Colors.white)),
        ),
      ),
    );
  }
}

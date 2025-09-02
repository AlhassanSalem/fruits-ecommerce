import 'package:ecommerce_fruits/core/widgets/custom_divider.dart';
import 'package:ecommerce_fruits/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_fruits/features/cart/presentation/views/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartCubit>().cartItems;
    return SliverList.separated(
      itemCount: cartItems.cartItems.length,
      itemBuilder: (context, index) {
        return CartItem(cartItem: cartItems.cartItems[index]);
      },
      separatorBuilder: (context, index) {
        return CustomDivider();
      },
    );
  }
}

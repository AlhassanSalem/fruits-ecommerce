import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_fruits/core/widgets/custom_button.dart';
import 'package:ecommerce_fruits/core/widgets/custom_divider.dart';
import 'package:ecommerce_fruits/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_fruits/features/cart/presentation/views/widgets/cart_items_list_view.dart';
import 'package:ecommerce_fruits/features/cart/presentation/views/widgets/cart_view_header.dart';
import 'package:ecommerce_fruits/features/cart/presentation/views/widgets/custom_cart_botton.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cartIsEmpty = context.watch<CartCubit>().cartItems.cartItems.isEmpty;
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customAppBar(context, title: LocaleKeys.cart),
                  const SizedBox(height: 16),
                  const CartViewHeader(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: cartIsEmpty
                  ? const SizedBox.shrink()
                  : const CustomDivider(),
            ),
            const CartItemsListView(),
            SliverToBoxAdapter(
              child: cartIsEmpty
                  ? const SizedBox.shrink()
                  : const CustomDivider(),
            ),
          ],
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * 0.05,
          left: 16,
          right: 16,
          child: CustomCartButton(),
        ),
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/utils/app_colors.dart';
import 'package:ecommerce_fruits/core/utils/app_styles.dart';
import 'package:ecommerce_fruits/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewHeader extends StatelessWidget {
  const CartViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEBF9F1),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Text(
          '${LocaleKeys.youHave.tr()} ${context.watch<CartCubit>().cartItems.cartItems.length} ${LocaleKeys.productsInYourCart.tr()}',
          style: TextStyles.regular13.copyWith(color: AppColors.darkPrimary),
        ),
      ),
    );
  }
}

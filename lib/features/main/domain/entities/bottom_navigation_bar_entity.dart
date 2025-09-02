import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/utils/app_assets.dart';
import 'package:ecommerce_fruits/features/cart/presentation/views/cart_view.dart';
import 'package:ecommerce_fruits/features/home/presentation/views/home_view.dart';
import 'package:ecommerce_fruits/features/products_view/presentation/views/products_view.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarEntity {
  final String activeIcon, inActiveIcon, label;
  final Widget page;

  const BottomNavigationBarEntity({
    required this.activeIcon,
    required this.inActiveIcon,
    required this.label,
    required this.page,
  });
}

List<BottomNavigationBarEntity> get getBottomNavigationBarItems => const [
  BottomNavigationBarEntity(
    activeIcon: Assets.imagesActiveHome,
    inActiveIcon: Assets.imagesHome,
    label: LocaleKeys.home,
    page: HomeView(),
  ),
  BottomNavigationBarEntity(
    activeIcon: Assets.imagesActiveProducts,
    inActiveIcon: Assets.imagesProducts,
    label: LocaleKeys.products,
    page: ProductsView(),
  ),
  BottomNavigationBarEntity(
    activeIcon: Assets.imagesActiveCart,
    inActiveIcon: Assets.imagesCart,
    label: LocaleKeys.shoppingCart,
    page: CartView(),
  ),
  BottomNavigationBarEntity(
    activeIcon: Assets.imagesActiveProfile,
    inActiveIcon: Assets.imagesProfile,
    label: LocaleKeys.profile,
    page: Center(child: Text(LocaleKeys.profile)),
  ),
];

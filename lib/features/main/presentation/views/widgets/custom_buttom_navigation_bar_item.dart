import 'package:ecommerce_fruits/features/main/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:ecommerce_fruits/features/main/presentation/views/widgets/active_bottom_navigation_bar_item.dart';
import 'package:ecommerce_fruits/features/main/presentation/views/widgets/in_active_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final bool isSelected;
  final BottomNavigationBarEntity item;

  const CustomBottomNavigationBarItem({
    super.key,
    required this.isSelected,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveBottomNavigationBarItem(item: item)
        : InactiveBottomNavigationBarItem(item: item);
  }
}

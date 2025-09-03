import 'package:ecommerce_fruits/features/main/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InactiveBottomNavigationBarItem extends StatelessWidget {
  final BottomNavigationBarEntity item;

  const InactiveBottomNavigationBarItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SvgPicture.asset(item.inActiveIcon),
    );
  }
}

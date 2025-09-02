import 'package:ecommerce_fruits/features/main/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:ecommerce_fruits/features/main/presentation/cubit/bottom_navigation_bar_cubit.dart';
import 'package:ecommerce_fruits/features/main/presentation/views/widgets/custom_buttom_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<BottomNavigationBarCubit>().state;
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: List.generate(getBottomNavigationBarItems.length, (index) {
          final item = getBottomNavigationBarItems[index];
          return Expanded(
            flex: currentIndex == index ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                context.read<BottomNavigationBarCubit>().changeIndex(index);
              },
              child: CustomBottomNavigationBarItem(
                isSelected: currentIndex == index,
                item: item,
              ),
            ),
          );
        }),
      ),
    );
  }
}

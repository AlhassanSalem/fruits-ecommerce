import 'package:ecommerce_fruits/features/main/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:ecommerce_fruits/features/main/presentation/cubit/bottom_navigation_bar_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: context.watch<BottomNavigationBarCubit>().state,
      children: getBottomNavigationBarItems.map((item) => item.page).toList(),
    );
  }
}

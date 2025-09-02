import 'package:ecommerce_fruits/core/cubit/products_cubit.dart';
import 'package:ecommerce_fruits/core/di/dependency_injection.dart';
import 'package:ecommerce_fruits/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => getIt<ProductsCubit>()..getBestSellingProducts(),
        child: const HomeViewBody(),
      ),
    );
  }
}

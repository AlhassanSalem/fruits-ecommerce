import 'package:ecommerce_fruits/core/cubit/products_cubit.dart';
import 'package:ecommerce_fruits/core/di/dependency_injection.dart';
import 'package:ecommerce_fruits/features/products_view/presentation/views/widgets/products_view_body.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductsCubit>()..getAllProducts(),
      child: ProductsViewBody(),
    );
  }
}

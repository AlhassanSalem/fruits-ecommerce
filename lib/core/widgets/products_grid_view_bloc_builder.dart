import 'package:ecommerce_fruits/core/cubit/products_cubit.dart';
import 'package:ecommerce_fruits/core/functions/get_dummy_product.dart';
import 'package:ecommerce_fruits/core/widgets/custom_error_widget.dart';
import 'package:ecommerce_fruits/core/widgets/products_items_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsItemsGridView(products: getDummyProductList()),
          );
        } else if (state is ProductsSuccess) {
          final products = state.products;
          return ProductsItemsGridView(products: products);
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(message: state.errMessage),
          );
        } else {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(message: 'Something went wrong!'),
          );
        }
      },
    );
  }
}

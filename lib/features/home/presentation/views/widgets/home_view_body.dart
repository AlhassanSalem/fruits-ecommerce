import 'package:ecommerce_fruits/core/helper/constants.dart';
import 'package:ecommerce_fruits/core/widgets/search_text_field.dart';
import 'package:ecommerce_fruits/core/widgets/products_grid_view_bloc_builder.dart';
import 'package:ecommerce_fruits/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:ecommerce_fruits/features/home/presentation/views/widgets/custom_home-app_bar.dart';
import 'package:ecommerce_fruits/features/home/presentation/views/widgets/featured_items_list.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: kTopPadding),
                const CustomHomeAppBar(),
                const SizedBox(height: 16),
                const SearchTextField(),
                const SizedBox(height: 12),
                const FeaturedItemsList(),
                const SizedBox(height: 12),
                const BestSellingHeader(),
                const SizedBox(height: 12),
              ],
            ),
          ),
          const ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}



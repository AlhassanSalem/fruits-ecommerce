import 'package:ecommerce_fruits/core/helper/constants.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_fruits/core/widgets/notifications_widget.dart';
import 'package:ecommerce_fruits/core/widgets/products_grid_view_bloc_builder.dart';
import 'package:ecommerce_fruits/core/widgets/search_text_field.dart';
import 'package:ecommerce_fruits/features/products_view/presentation/views/widgets/products_view_header.dart';
import 'package:flutter/widgets.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

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
                customAppBar(
                  context,
                  title: LocaleKeys.products,
                  showLeadingIcon: false,
                  trailing: NotificationsWidget(),
                ),
                const SearchTextField(),
                const SizedBox(height: 12),
                const ProductsViewHeader(productsLength: 4),
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

import 'package:ecommerce_fruits/core/entities/product_entity.dart';
import 'package:ecommerce_fruits/core/routing/routes.dart';
import 'package:ecommerce_fruits/core/widgets/fruit_item.dart';
import 'package:flutter/material.dart';

class ProductsItemsGridView extends StatelessWidget {
  const ProductsItemsGridView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.productDetailsView,
              arguments: products[index],
            );
          },
          child: FruitItem(product: products[index]),
        );
      },
    );
  }
}

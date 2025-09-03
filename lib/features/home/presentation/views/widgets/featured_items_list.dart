import 'package:ecommerce_fruits/features/home/presentation/views/widgets/featured_item.dart';
import 'package:flutter/material.dart';

class FeaturedItemsList extends StatelessWidget {
  const FeaturedItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          3,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: const FeaturedItem(),
          ),
        ),
      ),
    );
  }
}

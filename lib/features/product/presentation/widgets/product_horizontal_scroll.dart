import 'package:cosmetics_shop/features/product/data/product_data.dart';
import 'package:cosmetics_shop/features/product/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductHorizontalScroll extends StatelessWidget {
  final String mainPageCategory;

  const ProductHorizontalScroll({super.key, required this.mainPageCategory});

  @override
  Widget build(BuildContext context) {
    final filteredProducts = testProducts
        .where((product) => product.mainPageCategory == mainPageCategory)
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: filteredProducts.map((product) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ProductCard(product: product),
            );
          }).toList(),
        ),
      ),
    );
  }
}

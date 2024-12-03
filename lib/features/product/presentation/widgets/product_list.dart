import 'package:flutter/material.dart';
import 'package:cosmetics_shop/features/product/presentation/widgets/product_card.dart';
import '../../data/product_data.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 18,
          childAspectRatio: 0.65,
        ),
        itemCount: testProducts.length,
        itemBuilder: (context, index) {
          final product = testProducts[index];

          return ProductCard(product: product,size: 2,);
        },
      );
  }
}

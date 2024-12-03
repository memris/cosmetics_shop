import 'package:flutter/material.dart';
import 'package:cosmetics_shop/features/product/presentation/widgets/product_card.dart';
import '../../data/product_data.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.75,
        ),
        itemCount: testProducts.length,
        itemBuilder: (context, index) {
          final product = testProducts[index];

          return ProductCard(product: product);
        },
      ),
    ));
  }
}

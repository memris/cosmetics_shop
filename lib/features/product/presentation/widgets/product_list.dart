import 'package:flutter/material.dart';
import 'package:cosmetics_shop/features/product/presentation/widgets/product_card.dart';
import '../../domain/entities/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 18,
        childAspectRatio: 0.65,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return ProductCard(product: product, size: 2);
      },
    );
  }
}

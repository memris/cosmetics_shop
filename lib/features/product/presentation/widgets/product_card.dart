import 'package:cosmetics_shop/features/product/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Image.asset(
            product.imageUrl,
            width: 200,
            height: 200,
          ),
        ),
        Text(product.type),
        Text(product.title),
        Text("${product.price} ₽"),
      ],
    );
  }
}

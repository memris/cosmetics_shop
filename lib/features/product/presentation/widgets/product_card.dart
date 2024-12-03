import 'package:cosmetics_shop/features/product/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int size;

  const ProductCard({super.key, required this.product, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Image.asset(
            product.imageUrl,
            width: size == 1 ? 100 : 200,
            height: size == 1 ? 100 : 200,
          ),
        ),
        Text(product.type),
        Text(product.title),
        Text("${product.price} ₽",
        style: const TextStyle(fontWeight: FontWeight.bold),),
      ],
    );
  }
}

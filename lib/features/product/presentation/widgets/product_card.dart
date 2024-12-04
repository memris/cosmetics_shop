import 'package:cosmetics_shop/features/product/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  product.imageUrl,
                  width: 180,
                  height: 180,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Text(product.type),
          Text(
            product.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            "${formatNumber(product.price.round())} ₽",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

String formatNumber(int number) {
  final numberString = number.toString();
  final buffer = StringBuffer();

  for (int i = 0; i < numberString.length; i++) {
    if (i > 0 && (numberString.length - i) % 3 == 0) {
      buffer.write(' ');
    }
    buffer.write(numberString[i]);
  }

  return buffer.toString();
}

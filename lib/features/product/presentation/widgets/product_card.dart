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
      width: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          product.mainPageCategory == "Акции"
              ? Stack(
                  children: [
                    Card(
                      elevation: 0,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Image.asset(
                            product.imageUrl,
                            width: 170,
                            height: 170,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child:
                      product.type == "Крем"?
                          Column(
                            children: [
                              Image.asset(
                                'assets/promotion.png',
                                scale: 3.5,
                              ),
                              Image.asset(
                                'assets/icons/1plus1.png',
                                scale: 4.5,
                              ),
                            ],
                          ) : Image.asset(
                        'assets/promotion.png',
                        scale: 3.5,
                      ),
                    ),
                  ],
                )
              : Card(
            elevation: 0,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        product.imageUrl,
                        width: 170,
                        height: 170,
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
         product.mainPageCategory == "Акции" ?
             Row(
               children: [
                 Text(
                   "${formatNumber(product.price.round())} ₽",
                   style: const TextStyle(fontWeight: FontWeight.bold,
                     fontSize: 16,),
                 ),
                 SizedBox(width: 5,),
                 Text(
                   "${formatNumber(product.price.round())} ₽",
                   style:  TextStyle(fontWeight: FontWeight.bold,
                   fontSize: 16,
                   color: Colors.grey.shade400,
                       decoration: TextDecoration.lineThrough,
                       decorationColor: Colors.grey.shade400,
                   ),
                 ),
               ],
             )
             : Text(
            "${formatNumber(product.price.round())} ₽",
            style: const TextStyle(fontWeight: FontWeight.bold,
              fontSize: 16,),
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

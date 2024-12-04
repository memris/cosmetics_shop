import 'package:cosmetics_shop/features/product/data/product_data.dart';
import 'package:cosmetics_shop/features/product/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductHorizontalScroll extends StatelessWidget {
  const ProductHorizontalScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
       child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
         children:
           testProducts.map((product) {
             return Padding(
               padding: const EdgeInsets.symmetric(horizontal: 5),
               child: ProductCard(product: product,),
             );
           }).toList()
         ,
       ),
      ),
    );
  }

}
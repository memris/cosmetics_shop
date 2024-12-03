import 'package:cosmetics_shop/features/product/data/product_data.dart';
import 'package:cosmetics_shop/features/product/presentation/widgets/product_card.dart';
import 'package:cosmetics_shop/features/product/presentation/widgets/product_list.dart';
import 'package:flutter/material.dart';

class ProductHorizontalScroll extends StatelessWidget {
  const ProductHorizontalScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,

      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
       child: Row(

         children:
           testProducts.map((product) {
             return ProductCard(product: product,size: 1,);
           }).toList()
         ,
       ),
      ),
    );
  }

}
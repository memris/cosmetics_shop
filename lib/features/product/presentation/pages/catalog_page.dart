import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/product_list.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.fromLTRB(10, 140, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Каталог",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(child: ProductList()),
          ],
        ),
      );
  }

}
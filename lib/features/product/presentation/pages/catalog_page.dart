import 'package:cosmetics_shop/features/product/presentation/pages/selection_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/product_data.dart';
import '../../domain/entities/product.dart';
import '../widgets/product_list.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

final Map<String, List<String>> options = {
  "Назначение": ["Для лица", "Для тела", "Для волос"],
  "Тип средства": ["Крем", "Сыворотка", "Тонер"],
  "Тип кожи": ["Сухая", "Комбинированная", "Жирная"],
  "Линия косметики": ["Muse", "Forever Young"],
  "Наборы": [],
  "Акции": [],
  "Консультации с косметологом": [],
};

class _CatalogPageState extends State<CatalogPage> {
  Map<String, String> _selectedFilters = {};
  bool _isFiltered = false;

  @override
  void initState() {
    super.initState();
  }

  List<Product> _filterProducts(List<Product> products) {
    if (_selectedFilters.isEmpty) return products;

    return products.where((product) {
      bool matches = true;

      _selectedFilters.forEach((key, value) {
        if (key == "Тип средства" && product.type != value) matches = false;
        if (key == "Тип кожи" && product.skinType != value) matches = false;
        if (key == "Категория" && product.category != value) matches = false;
      });

      return matches;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 140, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!_isFiltered)
            ...options.entries.map((entry) {
              return TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectionPage(
                        filterName: entry.key,
                        options: entry.value,
                        onSelectedOption: (option) {
                          setState(() {
                            _selectedFilters[entry.key] = option;
                            _isFiltered = true;
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  );
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    entry.key,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            }).toList()
          else
            Expanded(
              child: ProductList(
                products: _filterProducts(testProducts),
              ),
            ),
        ],
      ),
    );
  }
}

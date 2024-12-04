import 'package:cosmetics_shop/features/product/presentation/pages/selection_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/product_list.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

final Map<String, List<String>> options = {
  "Назначение": ["Для лица", "Для тела", "Для волос"],
  "Тип средства": ["Крем", "Сыворотка", "Тоник"],
  "Тип кожи": ["Сухая", "Комбинированная", "Жирная"],
  "Линия косметики": ["Muse", "Forever Young"],
  "Наборы": [],
  "Акции": [],
  "Консультации с косметологом": [],
};

class _CatalogPageState extends State<CatalogPage> {
  String _selectedOption = "";
  bool _isFiltered = false;

  @override
  void initState() {
    super.initState();
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
                            _selectedOption = option;
                            Navigator.pop(context);
                            _isFiltered = true;
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
            Expanded(child: ProductList()),
        ],
      ),
    );
  }
}

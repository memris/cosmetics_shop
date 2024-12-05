import 'package:cosmetics_shop/features/product/presentation/pages/selection_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/product_data.dart';
import '../../domain/entities/product.dart';
import '../widgets/product_list.dart';

class CatalogPage extends StatefulWidget {
  final String? initialCategory;

  const CatalogPage({Key? key, this.initialCategory}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

final Map<String, List<String>> options = {
  "Назначение": ["Для лица", "Для тела", "Для волос"],
  "Тип средства": ["Крем", "Сыворотка", "Тонер"],
  "Тип кожи": ["Жирная", "Комбинированная", "Нормальная", "Сухая", "Любой тип"],
  "Линия косметики": ["Muse", "Forever Young", "Illustious", "Unstress"],
  "Эффект": ["Увлажнение", "Очищение", "Регенерация"],
  "Наборы": [],
  "Акции": [],
  "Консультации с косметологом": [],
};

class _CatalogPageState extends State<CatalogPage> {
  late Map<String, String> _selectedFilters;
  bool _isFiltered = false;

  @override
  void initState() {
    super.initState();

    _selectedFilters = widget.initialCategory != null
        ? {'Категория': widget.initialCategory!}
        : {};
    _isFiltered = _selectedFilters.isNotEmpty;
  }

  List<Product> _filterProducts(List<Product> products) {
    if (_selectedFilters.isEmpty) return products;

    return products.where((product) {
      bool matches = true;

      _selectedFilters.forEach((key, value) {
        if (key == "Тип средства" && product.type != value) matches = false;
        if (key == "Тип кожи" && !product.skinTypes.contains(value))
          matches = false;
        if (key == "Линия косметики" && product.cosmeticsLine != value)
          matches = false;
        if (key == "Категория" && product.category != value) matches = false;
      });

      return matches;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
      child: Column(
        children: [
          if (!_isFiltered)
            SearchBar(
              elevation: WidgetStateProperty.all(1),
              backgroundColor: const WidgetStatePropertyAll(Colors.white),
              hintText: "Поиск",
              hintStyle: WidgetStatePropertyAll(
                  TextStyle(fontSize: 18, color: Colors.grey.shade600)),
              leading: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          if (!_isFiltered)
            const SizedBox(
              height: 15,
            ),
          Expanded(
            child: !_isFiltered
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: options.entries.map((entry) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 60, 0),
                        child: Column(
                          children: [
                            TextButton(
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
                                child: entry.key == "Акции"
                                    ? Row(
                                        children: [
                                          Text(
                                            entry.key,
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(width: 3),
                                          Image.asset(
                                            "assets/promotion.png",
                                            scale: 3.5,
                                          ),
                                        ],
                                      )
                                    : Text(
                                        entry.key,
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              child: const Text(
                                "Средства",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 26),
                              ),
                            ),
                            Text("${testProducts.length} продукта"),
                            const SizedBox(height: 8),
                            SizedBox(
                              height: 50,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Увлажнение",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Очищение",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Регенерация",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ProductList(
                          products: _filterProducts(testProducts),
                        ),
                      ),
                    ],
                  ),
          ),
          if (!_isFiltered)
            Stack(children: [
              Container(
                color: Colors.grey.shade200,
              ),
              Image.asset(
                "assets/background_image_1.png",
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 350,
                      child: const Text(
                        "Составим схему идеального домашнего ухода",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "10 вопросов о вашей коже",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(0.75),
                        elevation: 0,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text("Пройти тест"),
                    ),
                  ],
                ),
              ),
            ]),
        ],
      ),
    );
  }
}

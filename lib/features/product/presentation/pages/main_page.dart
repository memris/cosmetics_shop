import 'package:cosmetics_shop/features/product/data/category_data.dart';
import 'package:cosmetics_shop/features/product/presentation/pages/catalog_page.dart';
import 'package:cosmetics_shop/features/product/presentation/pages/profile_page.dart';
import 'package:cosmetics_shop/features/product/presentation/pages/shopping_cart_page.dart';
import 'package:cosmetics_shop/features/product/presentation/widgets/colored_line.dart';
import 'package:cosmetics_shop/features/product/presentation/widgets/product_horizontal_scroll.dart';
import 'package:cosmetics_shop/features/product/presentation/widgets/product_list.dart';
import 'package:flutter/material.dart';

import '../widgets/category_scroll.dart';
import '../widgets/main_slider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    HomePage(),
    CatalogPage(),
    ShoppingCartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade200),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          fixedColor: Colors.black,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/home.png",
                  height: 32,
                  width: 32,
                ),
                label: "Главная"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/search.png",
                  height: 32,
                  width: 32,
                ),
                label: "Каталог"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/shopping.png",
                  height: 32,
                  width: 32,
                ),
                label: "Корзина"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/user.png",
                  height: 32,
                  width: 32,
                ),
                label: "Профиль")
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(child: MainSlider()),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          ),
          SizedBox(
            height: 110,
            child: CategoryScroll(categories: categoryData),
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Новинки",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                ColoredLine(mainPageCategory: "Новинки"),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          const Flexible(
            child: ProductHorizontalScroll(mainPageCategory: "Новинки"),
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Акции",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                ColoredLine(mainPageCategory: "Акции"),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          const Flexible(
            child: ProductHorizontalScroll(mainPageCategory: "Акции"),
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Хиты",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                ColoredLine(mainPageCategory: "Хиты"),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          const Flexible(
            child: ProductHorizontalScroll(mainPageCategory: "Хиты"),
          ),
         const SizedBox(height: 50,),
        ],
      ),
    );
  }
}

import 'package:cosmetics_shop/features/product/presentation/pages/catalog_page.dart';
import 'package:cosmetics_shop/features/product/presentation/pages/profile_page.dart';
import 'package:cosmetics_shop/features/product/presentation/pages/shopping_cart_page.dart';
import 'package:cosmetics_shop/features/product/presentation/widgets/product_horizontal_scroll.dart';
import 'package:cosmetics_shop/features/product/presentation/widgets/product_list.dart';
import 'package:flutter/material.dart';

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
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(child: MainSlider()),
          // Spacer(),
         const Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              "Новинки",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
         const Flexible(child: ProductHorizontalScroll()),
         const Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              "Акции",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
         const Flexible(child: ProductHorizontalScroll()),
        const  Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              "Хиты",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Flexible(child: ProductHorizontalScroll()),
        ],
      ),
    );
  }
}

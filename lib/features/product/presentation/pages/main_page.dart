import 'package:cosmetics_shop/features/product/presentation/widgets/product_list.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    MainPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.fromLTRB(10, 140, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Новинки",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(child: ProductList()),
          ],
        ),
      ),
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

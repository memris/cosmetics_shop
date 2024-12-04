import 'package:flutter/material.dart';

class ColoredLine extends StatelessWidget {
  final String mainPageCategory;

  const ColoredLine({super.key, required this.mainPageCategory});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 150,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          mainPageCategory == "Хиты"
              ? Colors.orangeAccent.withOpacity(0.8)
              : Colors.white,
          mainPageCategory == "Новинки"
              ? Colors.tealAccent
              : mainPageCategory == "Акции"
                  ? Colors.pink
                  : Colors.orange.shade800,
        ],
        begin: mainPageCategory == "Хиты"
            ? Alignment.centerRight
            : Alignment.centerLeft,
        end: mainPageCategory == "Хиты"
            ? Alignment.centerLeft
            : Alignment.centerRight,
      )),
    );
  }
}

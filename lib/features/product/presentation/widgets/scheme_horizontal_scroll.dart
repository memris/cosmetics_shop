import 'package:flutter/material.dart';

Map<String,String> schemeElements = {
  "Демакияж" : 'assets/scheme/1.png' ,
  "Очищение" : 'assets/scheme/2.png' ,
  "Сыворотка" :'assets/scheme/3.png',
  "Дневной крем" : 'assets/scheme/4.png' ,
};

class SchemeHorizontalScroll extends StatelessWidget {
  const SchemeHorizontalScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: schemeElements.entries.map((entry) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                  height: 110,
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Image.asset(entry.value)),
              Text(entry.key,style: const TextStyle(
                fontSize: 12
              ),),
            ],
          );
        }).toList(),
      ),
    );
  }
}
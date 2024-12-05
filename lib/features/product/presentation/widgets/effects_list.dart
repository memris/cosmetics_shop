import 'package:flutter/material.dart';

List<String> effects = ["Для очищения", "Для увлажнения", "Для питания", "Для омоложения"];

class EffectsList extends StatelessWidget {
  const EffectsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 6,
          childAspectRatio: 3,
      ),
      padding: const EdgeInsets.all(16.0),
      shrinkWrap: true,
      itemCount: effects.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 20,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side:  BorderSide(color: Colors.grey.shade400),
              ),
            ),
            child: Text(
              effects[index],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        );
      },
    );
  }
}
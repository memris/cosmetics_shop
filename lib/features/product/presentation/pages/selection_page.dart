import 'package:flutter/material.dart';

class SelectionPage extends StatelessWidget {
  final String filterName;
  final List<String> options;
  final void Function(String) onSelectedOption;

  const SelectionPage(
      {super.key,
        required this.filterName,
        required this.options,
        required this.onSelectedOption});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Container(
            height: 80,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ),
                Positioned.fill(
                  child: Column(
                    children: [
                      SizedBox(height: 5,),
                      Text(
                      filterName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ]
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options[index];
              return Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    onSelectedOption(option);
                  },
                  child: Text(
                    option,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

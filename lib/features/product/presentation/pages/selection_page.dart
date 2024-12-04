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
          SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(filterName),
            ],
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options[index];
                return TextButton(
                  onPressed:(){
                    onSelectedOption(option);
                  } ,
                    child: Text(option));
              }),
        ],
      ),
    );
  }
}

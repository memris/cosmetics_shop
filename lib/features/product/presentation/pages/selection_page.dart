import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          filterName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: ListView.builder(
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
    );
  }
}

import 'package:flutter/material.dart';
import 'selection_page.dart';

class FiltersPage extends StatefulWidget {
  final Map<String, List<String>> filterOptions;
  final Map<String, String> selectedFilters;
  final void Function(Map<String, String>) onApplyFilters;

  const FiltersPage({
    super.key,
    required this.filterOptions,
    required this.selectedFilters,
    required this.onApplyFilters,
  });

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  late Map<String, String> _currentFilters;

  @override
  void initState() {
    super.initState();
    _currentFilters = Map<String, String>.from(widget.selectedFilters);
  }

  void _navigateToSelectionPage(String filterName, List<String> options) async {
    final selectedOption = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => SelectionPage(
          filterName: filterName,
          options: options,
          onSelectedOption: (selected) {
            Navigator.pop(context, selected);
          },
        ),
      ),
    );

    if (selectedOption != null) {
      setState(() {
        _currentFilters[filterName] = selectedOption;
      });
    }
  }
  void _updateSortOption(String selectedOption) {
    setState(() {
      _currentFilters['Сортировка'] = selectedOption;
    });
  }


  @override
  Widget build(BuildContext context) {
    final filtersToDisplay = widget.filterOptions.entries.take(widget.filterOptions.length - 3);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Фильтры',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Text(
              'Сортировка',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            trailing: Text(
              _currentFilters['Сортировка'] ?? 'Не выбрано',
              style: const TextStyle(color: Colors.grey, fontSize: 19),
            ),
            onTap: () async {
              final selectedOption = await showModalBottomSheet<String>(
                context: context,
                builder: (context) => SelectionPage(
                  filterName: 'Сортировка',
                  options: [
                    'По популярности',
                    'По возрастанию цены',
                    'По убыванию цены',
                  ],
                  onSelectedOption: (selected) {
                    Navigator.pop(context, selected);
                  },
                ),
              );

              if (selectedOption != null) {
                _updateSortOption(selectedOption);
              }
            },
          ),

          ...filtersToDisplay.map((entry) {
            final filterName = entry.key;
            final options = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Text(
                    filterName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  trailing: Text(
                    _currentFilters[filterName] ?? 'Не выбрано',
                    style: const TextStyle(color: Colors.grey, fontSize: 19),
                  ),
                  onTap: () {
                    _navigateToSelectionPage(filterName, options);
                  },
                ),
              ],
            );
          }),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            widget.onApplyFilters(_currentFilters);
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            'Применить',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),

    );
  }
}

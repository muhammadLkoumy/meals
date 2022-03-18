import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {

  static const filtersScreen = 'filters_screen';
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: const Center(child: Text('Filters')),
      drawer: const MainDrawer(),
    );
  }
}

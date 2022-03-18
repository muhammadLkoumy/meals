import 'package:flutter/material.dart';
import '../shared/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(14),
        child: GridView(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3.09 / 2,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
          ),
          children: DUMMY_CATEGORIES.map((category) {
            return CategoryItem(
              title: category.title,
              color: category.color,
              id: category.id,
            );
          }).toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import './screens/categories_screen.dart';

void main() {
  runApp(const Meals());
}

class Meals extends StatelessWidget {
  const Meals({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routes: {
        '/' : (BuildContext context) => const TabsScreen(),
        CategoryMealsScreen.categoryMealsScreen : (BuildContext context) => const CategoryMealsScreen(),
        MealDetailsScreen.mealDetailsScreen : (BuildContext context) => const MealDetailsScreen(),
        FiltersScreen.filtersScreen : (BuildContext context) => const FiltersScreen(),
      },
    );
  }
}

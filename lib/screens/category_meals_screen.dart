import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/shared/dummy_data.dart';
import 'package:meals/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String categoryMealsScreen = 'category_meals_screen';

  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final categoryId = args['id'];
    categoryTitle = args['title'];
    categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    void _removeMeal(String mealId) {
      setState(() {

      });
      categoryMeals.removeWhere((meal) => meal.id == mealId);
      print('================>>>>>>>>> Done');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return MealItems(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            removeItem: _removeMeal,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}

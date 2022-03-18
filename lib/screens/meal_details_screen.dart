import 'package:flutter/material.dart';
import '../shared/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const mealDetailsScreen = 'meal_details_screen';

  const MealDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  selectedMeal.imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: selectedMeal.ingredients.map((item) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.amber,
                      ),
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  'Steps',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}', style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),),
                        backgroundColor: Colors.amber,
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pop(mealId);
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:lottie/lottie.dart';

import '../models/meal.dart';

class MealItems extends StatelessWidget {
  final String id;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final Function removeItem;

  const MealItems({
    Key? key,
    required this.id,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.imageUrl,
    required this.duration,
    required this.removeItem,
  }) : super(key: key);

  String get affordabilityText {
    String txt;
    switch (affordability) {
      case Affordability.Affordable:
        txt = 'Affordable';
        break;
      case Affordability.Pricey:
        txt = 'Pricey';
        break;
      case Affordability.Luxurious:
        txt = 'Luxurious';
        break;
      default:
        txt = 'Unknown';
    }
    return txt;
  }

  String get complexityText {
    String txt;
    switch (complexity) {
      case Complexity.Simple:
        txt = 'Simple';
        break;
      case Complexity.Challenging:
        txt = 'Challenging';
        break;
      case Complexity.Hard:
        txt = 'Hard';
        break;
      default:
        txt = 'Unknown';
    }
    return txt;
  }

  void goToMealDetails(BuildContext context) {
    Navigator.pushNamed(
      context,
      MealDetailsScreen.mealDetailsScreen,
      arguments: id,
    ).then((result) {
      // print(result);
      if(result != null) removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () => goToMealDetails(context),
        borderRadius: BorderRadius.circular(14),
        splashColor: Theme.of(context).primaryColor,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5.0,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
                child: Stack(
                  children: [
                    FadeInImage.assetNetwork(
                      placeholder: 'assets/images/ripple.gif',
                      image: imageUrl,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,

                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        width: 300,
                        color: Colors.black54,
                        child: Text(
                          title,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.white,
                                    fontFamily: 'Raleway',
                                    fontSize: 26,
                                  ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '$duration min',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.work),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          complexityText,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.attach_money),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          affordabilityText,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

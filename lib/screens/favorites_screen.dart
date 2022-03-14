import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal>? favoriteMeals;

  const FavoritesScreen({Key? key, required this.favoriteMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals!.isEmpty)
      return Center(
        child: Text('No favorite meal yet'),
      );
    else
      return ListView.builder(
        itemCount: favoriteMeals?.length,
        itemBuilder: (_, index) => Container(
            child: MealItem(
          imageUrl: favoriteMeals![index].imageUrl,
          title: favoriteMeals![index].title,
          duration: favoriteMeals![index].duration,
          complexity: favoriteMeals![index].complexity,
          affordability: favoriteMeals![index].affordability,
          id: favoriteMeals![index].id,
        )),
      );
  }
}

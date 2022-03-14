import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal>? favoriteMeals;

  const FavoritesScreen({Key? key, required this.favoriteMeals})
      : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals!.isEmpty)
      return Center(
        child: Text('No favorite meal yet'),
      );
    else
      return ListView.builder(
        itemCount: widget.favoriteMeals?.length,
        itemBuilder: (_, index) => Container(
            child: MealItem(
          imageUrl: widget.favoriteMeals![index].imageUrl,
          title: widget.favoriteMeals![index].title,
          duration: widget.favoriteMeals![index].duration,
          complexity: widget.favoriteMeals![index].complexity,
          affordability: widget.favoriteMeals![index].affordability,
          id: widget.favoriteMeals![index].id,
          update: () {
            setState(() {});
          },
        )),
      );
  }
}

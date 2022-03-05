import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  const CategoryItem({
    Key? key,
    required this.title,
    required this.color,
    required this.id,
  }) : super(key: key);

  void selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => CategoryMealsScreen(
              categoryId: id,
              categoryTitle: title,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(30),
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

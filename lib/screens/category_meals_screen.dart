import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;
  // const CategoryMealsScreen(
  //     {Key? key, required this.categoryId, required this.categoryTitle})
  //     : super(key: key);

  static const routeName = '/category-meals';

  final List<Meal> availabelMeals;

  const CategoryMealsScreen({Key? key, required this.availabelMeals})
      : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  bool _didLoaded = false;
  String? categoryTitle;
  List<Meal>? categoryMeals;

  @override
  void didChangeDependencies() {
    if (!_didLoaded) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      categoryMeals = widget.availabelMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _didLoaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle!,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      body: ListView.builder(
        itemCount: categoryMeals?.length,
        itemBuilder: (_, index) => Container(
            child: MealItem(
          imageUrl: categoryMeals![index].imageUrl,
          title: categoryMeals![index].title,
          duration: categoryMeals![index].duration,
          complexity: categoryMeals![index].complexity,
          affordability: categoryMeals![index].affordability,
          id: categoryMeals![index].id,
          update: () {},
        )),
      ),
    );
  }
}

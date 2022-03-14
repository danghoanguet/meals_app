import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'lactose': false,
    'vegetarian': false,
  };

  List<Meal> _availabelMeals = DUMMY_MEALS;
  List<Meal>? _favoriteMeals = [];

  bool _isFavoriteMeal(String id) {
    return _favoriteMeals!.any((meal) => meal.id == id);
  }

  void _toggleFavorite(String id) {
    final existingIndex = _favoriteMeals!.indexWhere((meal) => meal.id == id);
    if (existingIndex >= 0)
      setState(() {
        _favoriteMeals!.removeAt(existingIndex);
      });
    else
      setState(() {
        _favoriteMeals!.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      });
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availabelMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && meal.isGlutenFree == false)
          return false;
        if (_filters['lactose'] == true && meal.isLactoseFree == false)
          return false;
        if (_filters['vegan'] == true && meal.isVegan == false) return false;
        if (_filters['vegetarian'] == true && meal.isVegetarian == false)
          return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
              bodyMedium: TextStyle(
                // this is default setting for text
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodySmall: TextStyle(color: Colors.white, fontSize: 20),
            ),
      ),
      //home: CategoriesScreen(),
      //initialRoute: '/', // default value is '/'
      routes: {
        '/': (context) => TabScreen(
              favoriteMeal: _favoriteMeals,
            ),
        //'/category-meals': (_) => CategoryMealsScreen(),
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(
              availabelMeals: _availabelMeals,
            ),
        MealDetailsScreen.routeName: (_) => MealDetailsScreen(
              isFavoriteMeal: _isFavoriteMeal,
              toggleFavorite: _toggleFavorite,
            ),
        FiltersScreen.routeName: (_) => FiltersScreen(
              currentFilters: _filters,
              saveFilters: _setFilters,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}

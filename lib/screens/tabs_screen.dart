import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal>? favoriteMeal;

  const TabScreen({Key? key, required this.favoriteMeal}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>>? _pages;

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoritesScreen(favoriteMeals: widget.favoriteMeal),
        'title': 'Favorites'
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meals'),
    //       bottom: TabBar(tabs: [
    //         Tab(
    //           icon: Icon(Icons.category),
    //           text: 'Categories',
    //         ),
    //         Tab(
    //           icon: Icon(Icons.star),
    //           text: 'Favorites',
    //         ),
    //       ]),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         CategoriesScreen(),
    //         FavoritesScreen(),
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages![_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages![_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) => _selectPage(val),
        // backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        selectedLabelStyle: TextStyle(fontSize: 20),
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(
                Icons.category,
                //color: Colors.black,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(
                Icons.star,
              ),
              label: 'Favorites'),
        ],
      ),
    );
  }
}

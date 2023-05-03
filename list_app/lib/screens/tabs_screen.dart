import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './categories_screen.dart';
import '../model/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Meals',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          bottom: TabBar(
            dividerColor: Theme.of(context).colorScheme.secondary,
            tabs: const <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen(widget.favoriteMeals),
          ],
        ),
      ),
    );
  }
}

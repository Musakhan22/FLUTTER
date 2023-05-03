import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../model/meal.dart';

class CatMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CatMealsScreen(this.availableMeals);

  @override
  State<CatMealsScreen> createState() => _CatMealsScreenState();
}

class _CatMealsScreenState extends State<CatMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
   //....
    super.initState();
  }
  @override
  void didChangeDependencies() {
    if(!_loadedInitData){
      final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitData = true;
    } 
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId){
    setState(() {
      displayedMeals?.removeWhere((meal) => meal.id == mealId);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          categoryTitle as String,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeals![index].id,
              title: displayedMeals![index].title,
              imageUrl: displayedMeals![index].imageUrl,
              duration: displayedMeals![index].duration,
              affordability: displayedMeals![index].affordability,
              complexity: displayedMeals![index].complexity,
              // removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals!.length,
        ),
    );
  }
}

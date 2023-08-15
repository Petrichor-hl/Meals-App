import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/app_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  final List<Meal> _favoriteMeals = [dummyMeals[3], dummyMeals[4]];

  Map<String, bool> _selectedFilters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegetarian': false,
    'vegan': false,
  };

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(message),
      ),
    );
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showMessage('Meal is no longer a favorite.');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showMessage('Marked as a favorite!');
      });
    }
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);

    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<String, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            currentFilters: _selectedFilters,
          ),
        ),
      );
      setState(() {
        _selectedFilters = result!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = dummyMeals.where((meal) {
      if (_selectedFilters['glutenFree']! && !meal.isGlutenFree) {
        return false;
      }

      if (_selectedFilters['lactoseFree']! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters['vegan']! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedPageIndex == 0 ? 'Categories' : 'Farvorites'),
      ),
      drawer: AppDrawer(
        onSelectScreen: _setScreen,
      ),
      body: _selectedPageIndex == 0
          ? CategoriesScreen(
              onToggleFavorite: _toggleMealFavoriteStatus,
              availablesMeals: filteredMeals,
            )
          : MealsScreen(
              meals: _favoriteMeals,
              onToggleFavorite: _toggleMealFavoriteStatus,
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
      ),
    );
  }
}

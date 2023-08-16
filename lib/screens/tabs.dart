import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

import 'package:meals_app/providers/favorites_provider.dart';

import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/app_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final filteredMeals = ref.watch(filteredMealsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedPageIndex == 0 ? 'Categories' : 'Farvorites'),
      ),
      drawer: const AppDrawer(),
      body: _selectedPageIndex == 0
          ? CategoriesScreen(availablesMeals: filteredMeals)
          : MealsScreen(meals: ref.watch(favoriteMealsProvider)),
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

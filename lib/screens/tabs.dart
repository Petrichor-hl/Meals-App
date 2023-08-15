import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedPageIndex == 0 ? 'Categories' : 'Farvorites'),
      ),
      body: _selectedPageIndex == 0
          ? const CategoriesScreen()
          : const MealsScreen(meals: [
              Meal(
                id: 'm2',
                categories: [
                  'c2',
                ],
                title: 'Toast Hawaii',
                affordability: Affordability.affordable,
                complexity: Complexity.simple,
                imageUrl:
                    'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
                duration: 10,
                ingredients: [
                  '1 Slice White Bread',
                  '1 Slice Ham',
                  '1 Slice Pineapple',
                  '1-2 Slices of Cheese',
                  'Butter'
                ],
                steps: [
                  'Butter one side of the white bread',
                  'Layer ham, the pineapple and cheese on the white bread',
                  'Bake the toast for round about 10 minutes in the oven at 200°C'
                ],
                isGlutenFree: false,
                isVegan: false,
                isVegetarian: false,
                isLactoseFree: false,
              ),
              Meal(
                id: 'm3',
                categories: [
                  'c2',
                  'c3',
                ],
                title: 'Classic Hamburger',
                affordability: Affordability.pricey,
                complexity: Complexity.simple,
                imageUrl:
                    'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
                duration: 45,
                ingredients: [
                  '300g Cattle Hack',
                  '1 Tomato',
                  '1 Cucumber',
                  '1 Onion',
                  'Ketchup',
                  '2 Burger Buns'
                ],
                steps: [
                  'Form 2 patties',
                  'Fry the patties for c. 4 minutes on each side',
                  'Quickly fry the buns for c. 1 minute on each side',
                  'Bruch buns with ketchup',
                  'Serve burger with tomato, cucumber and onion'
                ],
                isGlutenFree: false,
                isVegan: false,
                isVegetarian: false,
                isLactoseFree: true,
              ),
            ]),
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

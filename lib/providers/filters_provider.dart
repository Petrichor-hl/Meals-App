import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

class FilterNotifier extends StateNotifier<Map<String, bool>> {
  FilterNotifier()
      : super({
          'glutenFree': false,
          'lactoseFree': false,
          'vegetarian': false,
          'vegan': false,
        });

  void setFilter(Map<String, bool> chosenFilters) {
    state = chosenFilters;
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotifier, Map<String, bool>>(
  (ref) => FilterNotifier(),
);

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final currentFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (currentFilters['glutenFree']! && !meal.isGlutenFree) {
      return false;
    }

    if (currentFilters['lactoseFree']! && !meal.isLactoseFree) {
      return false;
    }
    if (currentFilters['vegetarian']! && !meal.isVegetarian) {
      return false;
    }
    if (currentFilters['vegan']! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});

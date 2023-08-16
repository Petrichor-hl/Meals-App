import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  /// return true, if meal added to favorites list.
  ///
  /// return false, if meal removed from favorites list.
  bool toggleMealFavoritesStatus(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((element) => element != meal).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
  (ref) => FavoriteMealsNotifier(),
);

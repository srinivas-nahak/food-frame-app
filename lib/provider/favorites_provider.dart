import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

///Here we're writing StateNotifier<List<Meal>> and not just StateNotifier to elaborate the StateNotifier a bit more
///
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  ///It can also be written as "FavoriteMealsNotifier(super.state);"
  FavoriteMealsNotifier() : super([]);

  /// So here state is an instance of List<Meal> but it can't add elements directly with .add() or .remove()
  /// That's why we need to create new instance of state object and assign to it.

  bool toggleMealFavoriteStatus(Meal meal) {
    final isExisting = state.contains(meal);

    if (isExisting) {
      state =
          state.where((existingMeal) => existingMeal.id != meal.id).toList();

      return false;
    } else {
      ///As we can't use .add() method so we're getting all data using ... then appending the newMeal
      state = [...state, meal];

      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
        (ref) => FavoriteMealsNotifier());

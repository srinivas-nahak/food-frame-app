import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/data/dummy_data.dart';
import 'package:meals_app/provider/meals_provider.dart';

import '../models/meal.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false
        });

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
        (ref) => FilterNotifier());

///Connecting Multiple Providers for robust operations
//But it's a good practice to keep the providers separately
final filteredMealsProvider = Provider<List<Meal>>((ref) {
  List<Meal> meals = ref.watch(mealsProvider);
  Map<Filter, bool> selectedFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if ((selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) ||
        (selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) ||
        (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) ||
        (selectedFilters[Filter.vegan]! && !meal.isVegan)) {
      return false;
    }

    return true;
  }).toList();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/dummy_data.dart';
import '../enums/enums.dart';

class FilterProviderListner extends StateNotifier<Map<Filter, bool>> {
  FilterProviderListner()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false
        });

  void setFilter(Filter filter, bool value) {
    state = {...state, filter: value};
  }
}

final filterProvider =
    StateNotifierProvider<FilterProviderListner, Map<Filter, bool>>((ref) {
  return FilterProviderListner();
});

final availableMealsProvider = Provider((ref) {
    final selectedFileters = ref.watch(filterProvider);
  return dummyMeals.where((meal) {
      if (selectedFileters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFileters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFileters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFileters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
});

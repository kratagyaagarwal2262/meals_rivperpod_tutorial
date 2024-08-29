import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';
import '../service/service.dart';

class FavouriteNotifierProvider extends StateNotifier<List<Meal>> {
  FavouriteNotifierProvider() : super([]) {
    loadMeals();
  }

  MealService service = MealService();

  Future<void> loadMeals() async {
    final List<Meal> meals = await service.getAllMeals();
    state = meals;
  }

  Future<bool> addFavroutie(Meal meals) async {
    if (state.contains(meals)) {
      await service.deleteMeal(state.indexWhere((m) => m.id == meals.id));
      state = state.where((m) => m.id != meals.id).toList();
      return false;
    } else {
      service.addMeal(meals);
      state = [...state, meals];
      return true;
    }
  }
}

final favouriteProviderNotifier =
    StateNotifierProvider<FavouriteNotifierProvider, List<Meal>>((ref) {
  return FavouriteNotifierProvider();
});

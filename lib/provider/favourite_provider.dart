import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavouriteNotifierProvider extends StateNotifier<List<Meal>> {
  FavouriteNotifierProvider() : super([]);

  bool addFavroutie(Meal meals) {
    if (state.contains(meals)) {
      state = state.where((m) => m.id != meals.id).toList();
      return false;
    } else {
      state = [...state, meals];
      return true;
    }
  }
}

final favouriteProviderNotifier =
    StateNotifierProvider<FavouriteNotifierProvider, List<Meal>>((ref) {
  return FavouriteNotifierProvider();
});

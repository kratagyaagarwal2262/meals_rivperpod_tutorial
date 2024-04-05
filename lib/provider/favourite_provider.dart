import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

// In Riverpod we use StateNotifer instead of ChangeNotifier
// Also we have to give the notifier a default value or a "State" which we are going to manipulate.
// So in normal provider where we could have multiple listeners, here We can only have one. The "State"

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  /// It's important to create a contructor for this class. We use super to call the parent of this class
  /// That is StateNotifer<type> where we pass the default value of this class which is a list in this case.

  FavouriteMealsNotifier() : super([]);

  bool addFavouriteMeal(Meal meals) {
    /// There is no "notifyListeners" in riverpod. we use what we call "State" here the "State" is List<Meal>
    /// Also one more important distinction. In Riverpod you CANNOT add or remove data. So you need to create
    /// a new object/variable instead of manupilating it.

    bool isFavourite = state.contains(meals);

    if (isFavourite) {
      // Since we cannot add or remove data from the list, we will change the value of the "State" itself

      state = state
          .where(
            (element) => element.id != meals.id,
          )
          .toList();
          return false;
    } else {
      state = [...state, meals];
      return true;
    }
  }
}

/// Now create a object which would be used to REACH OUT to this class
/// We also SHOULD give the expected parameters to this object. One would the the class itself and the
/// second would the the type of the "State"

final favouriteProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
  return FavouriteMealsNotifier();
});

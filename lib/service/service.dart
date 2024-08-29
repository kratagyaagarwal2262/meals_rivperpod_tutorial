import 'package:hive_flutter/hive_flutter.dart';

import '../models/meal.dart';

class MealService {
  final String _boxName = "categoryList";

  Future<Box<Meal>> get _box async => await Hive.openBox<Meal>(_boxName);

//create
  Future<void> addMeal(Meal meal) async {
    var box = await _box;
    await box.add(meal);
  }

//read
  Future<List<Meal>> getAllMeals() async {
    var box = await _box;
    return box.values.toList();
  }

//delete
  Future<void> deleteMeal(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }
}

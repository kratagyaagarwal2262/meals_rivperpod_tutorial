import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/dummy_data.dart';

var dummyMealsProvider = Provider((ref) {
  return dummyMeals;
});
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

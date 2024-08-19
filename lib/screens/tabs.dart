import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/provider/favourite_provider.dart';
import 'package:meals/provider/filters_provider.dart';
import 'package:meals/provider/index_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

import '../enums/enums.dart';


class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedFileters = ref.watch(filterProvider);
    final availableMeals = dummyMeals.where((meal) {
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

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (ref.watch(indexProvider) == 1) {
      activePage = MealsScreen(
        meals: ref.watch(favouriteProviderNotifier),
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: ref.watch(indexProvider.notifier).changeIndex,
        currentIndex: ref.watch(indexProvider),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}

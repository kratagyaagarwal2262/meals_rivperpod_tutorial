import 'package:hive/hive.dart';

part 'meal.g.dart';
enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}
@HiveType(typeId: 1) 
class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

 
  @HiveField(0)
  final String id;

  @HiveField(1)
  final List<String> categories;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String imageUrl;

  @HiveField(4)
  final List<String> ingredients;

  @HiveField(5)
  final List<String> steps;

  @HiveField(6)
  final int duration;

  @HiveField(7)
  final Complexity complexity;

  @HiveField(8)
  final Affordability affordability;

  @HiveField(9)
  final bool isGlutenFree;

  @HiveField(10)
  final bool isLactoseFree;

  @HiveField(11)
  final bool isVegan;

  @HiveField(12)
  final bool isVegetarian;
}

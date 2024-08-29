// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************


class ComplexityAdapter extends TypeAdapter<Complexity> {
  @override
  final typeId = 2;

  @override
  Complexity read(BinaryReader reader) {
    return Complexity.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, Complexity obj) {
    writer.writeByte(obj.index);
  }
}

class AffordabilityAdapter extends TypeAdapter<Affordability> {
  @override
  final typeId = 3;

  @override
  Affordability read(BinaryReader reader) {
    return Affordability.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, Affordability obj) {
    writer.writeByte(obj.index);
  }
}

class MealAdapter extends TypeAdapter<Meal> {
  @override
  final int typeId = 1;

  @override
  Meal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meal(
      id: fields[0] as String,
      categories: (fields[1] as List).cast<String>(),
      title: fields[2] as String,
      imageUrl: fields[3] as String,
      ingredients: (fields[4] as List).cast<String>(),
      steps: (fields[5] as List).cast<String>(),
      duration: fields[6] as int,
      complexity: fields[7] as Complexity,
      affordability: fields[8] as Affordability,
      isGlutenFree: fields[9] as bool,
      isLactoseFree: fields[10] as bool,
      isVegan: fields[11] as bool,
      isVegetarian: fields[12] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Meal obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.categories)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.ingredients)
      ..writeByte(5)
      ..write(obj.steps)
      ..writeByte(6)
      ..write(obj.duration)
      ..writeByte(7)
      ..write(obj.complexity)
      ..writeByte(8)
      ..write(obj.affordability)
      ..writeByte(9)
      ..write(obj.isGlutenFree)
      ..writeByte(10)
      ..write(obj.isLactoseFree)
      ..writeByte(11)
      ..write(obj.isVegan)
      ..writeByte(12)
      ..write(obj.isVegetarian);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

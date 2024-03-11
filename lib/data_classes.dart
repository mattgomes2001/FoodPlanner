import 'dart:convert';

class Nourriture {
  // Nom, Quantite
  final String name;

  Nourriture(this.name);

  Map toMap() {
    return {"name": name};
  }

  String toJson() {
    return json.encode(toMap());
  }
}

class Ingredient extends Nourriture {
  // Nom, Quantite, CaloriePerUnite, Is
  final double quantity;
  final int caloriePerUnit;
  final bool isDenombrable;
  final String unite;

  Ingredient(
      String name, this.quantity, this.isDenombrable, this.caloriePerUnit)
      : unite = isDenombrable ? "" : "g",
        super(name);

  @override
  Map toMap() {
    var map = super.toMap();
    map.addAll({
      'quantity': quantity,
      'caloriePerUnit': caloriePerUnit,
      'isDenombrable': isDenombrable,
      'unite': unite
    });
    return map;
  }
}

class PlatPrepare extends Nourriture {
  final double quantity;
  PlatPrepare(String name, this.quantity) : super(name);

  @override
  Map toMap() {
    var map = super.toMap();
    map.addAll({'quantity': quantity});
    return map;
  }
}

class Recette extends Nourriture {
  final int duration;
  final List<Ingredient> listIng;
  final String pathToRecipe;
  final int calories;

  Recette(String name, this.duration, this.listIng, this.pathToRecipe)
      : calories = _calculateCalories(listIng),
        super(name);

  static int _calculateCalories(List<Ingredient> listIng) {
    int totalCalories = 0;
    for (var ingredient in listIng) {
      totalCalories +=
          (ingredient.quantity * ingredient.caloriePerUnit).round();
    }
    return totalCalories;
  }

  @override
  Map toMap() {
    var map = super.toMap();
    var listIngMaps = [];
    for (var i = 0; i < listIng.length; i++) {
      listIngMaps.add(listIng[i].toMap());
    }
    map.addAll({
      "duration": duration,
      "listIng": listIngMaps,
      "pathToRecipe": pathToRecipe,
      'calories': calories
    });

    return map;
  }
}

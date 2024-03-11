class Aliment {
  // Nom, Quantite
  final String name;
  final double quantity;

  Aliment(this.name, this.quantity);
}

class Ingredient extends Aliment {
  // Nom, Quantite, CaloriePerUnite, Is
  final int caloriePerUnit;
  final bool isDenombrable;
  final String unite;

  Ingredient(
      String name, double quantity, this.isDenombrable, this.caloriePerUnit)
      : unite = isDenombrable ? "" : "g",
        super(name, quantity);
}

class PlatPrepare extends Aliment {
  PlatPrepare(String name, double quantity) : super(name, quantity);
}

class Recette {
  final String name;
  final int duration;
  final List<Ingredient> listIng;
  final int calories;
  final String pathToRecipe;

  Recette(this.name, this.duration, this.listIng, this.pathToRecipe)
      : calories = _calculateCalories(listIng);

  static int _calculateCalories(List<Ingredient> listIng) {
    int totalCalories = 0;
    for (var ingredient in listIng) {
      totalCalories +=
          (ingredient.quantity * ingredient.caloriePerUnit).round();
    }
    return totalCalories;
  }
}

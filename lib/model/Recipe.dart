class Recipe {
  late String id;
  late String? name;
  late String? imageUrl;
  late String? rating;
  late String? protiens;
  late String? fats;
  late String? carbohydrates;
  late String? ingredients;
  late String? direction;
  late String? calories;
  late String? season;
  late String? mealType;
  late String? preparationTime;
  late String? cookingTime;

  Recipe({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.protiens,
    required this.fats,
    required this.carbohydrates,
    required this.ingredients,
    required this.direction,
    required this.calories,
    required this.season,
    required this.mealType,
    required this.preparationTime,
    required this.cookingTime,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id : json['id'],
      name : json['name'],
      imageUrl : json['imageUrl'],
      rating : json['rating'],
      protiens : json['protiens'],
      fats : json['fats'],
      carbohydrates : json['carbohydrates'],
      ingredients : json['ingredients'],
      direction : json['direction'],
      calories : json['calories'],
      season : json['season'],
      mealType : json['mealType'],
      preparationTime : json['preparationTime'],
      cookingTime : json['cookingTime']
    );
  }



}
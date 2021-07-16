class Menus {
  List<String> foods;
  List<String> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    foods: List<String>.from(json["foods"].map((food) => food['name'])),
    drinks: List<String>.from(json["drinks"].map((drink) => drink['name'])),
  );
}

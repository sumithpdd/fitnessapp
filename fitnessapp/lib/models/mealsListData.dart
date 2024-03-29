class MealsListData {
  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  int kacl;

  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = "",
    this.endColor = "",
    this.meals,
    this.kacl = 0,
  });

  static List<MealsListData> tabIconsList = [
    MealsListData(
      imagePath: 'images/fitness_app/breakfast.png',
      titleTxt: 'Breakfast',
      kacl: 525,
      meals: ["Bread,", "Peanut butter,", "Apple"],
      startColor: "#FA7D82",
      endColor: "#FFB295",
    ),
    MealsListData(
      imagePath: 'images/fitness_app/lunch.png',
      titleTxt: 'Lunch',
      kacl: 602,
      meals: ["Salmon,", "Mixed veggies,", "Avocado"],
      startColor: "#738AE6",
      endColor: "#5C5EDD",
    ),
    MealsListData(
      imagePath: 'images/fitness_app/snack.png',
      titleTxt: 'Snack',
      kacl: 0,
      meals: ["Recommend:", "800 kcal"],
      startColor: "#FE95B6",
      endColor: "#FF5287",
    ),
    MealsListData(
      imagePath: 'images/fitness_app/dinner.png',
      titleTxt: 'Dinner',
      kacl: 0,
      meals: ["Recommend:", "703 kcal"],
      startColor: "#6F72CA",
      endColor: "#1E1466",
    ),
  ];
}

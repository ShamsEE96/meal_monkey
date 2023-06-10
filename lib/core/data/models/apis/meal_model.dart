class MealModel {
  String? name;
  int? mealId;
  int? categoryId;
  int? price;
  List<String>? images;

  MealModel({this.name, this.mealId, this.categoryId, this.price, this.images});

  MealModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mealId = json['mealId'];
    categoryId = json['categoryId'];
    price = json['price'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mealId'] = this.mealId;
    data['categoryId'] = this.categoryId;
    data['price'] = this.price;
    data['images'] = this.images;
    return data;
  }
}

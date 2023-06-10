import 'package:get/get.dart';
import 'package:meal_monkey/core/data/models/apis/category_model.dart';
import 'package:meal_monkey/core/data/repositories/category_repository.dart';

class HomeController extends GetxController {
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;

  Future getAllCategory() {
    return CategoryRepository().getAll().then(
      (value) {
        value.fold((l) {}, (r) {});
      },
    );
  }
}

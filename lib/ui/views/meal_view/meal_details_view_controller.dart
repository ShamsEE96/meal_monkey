import 'package:get/get.dart';
import 'package:meal_monkey/core/data/models/apis/meal_model.dart';
import 'package:meal_monkey/ui/views/main_view/main_view_controller.dart';

class MealDetailsController extends MainController {
  MealDetailsController({required MealModel mealModel}) {
    model = mealModel;
  }

  MealModel model = MealModel();
  RxInt count = 1.obs;

  void changeCount(bool increase) {
    if (increase)
      count++;
    else {
      if (count > 1) {
        count--;
      }
    }
  }

  double calcTotal() {
    return (count.value * model.price!).toDouble();
  }

  int mealTotalPrice(int price) {
    return price * count.value;
  }

  // int mealCountChange() {
  //   return count.value;
  // }
}

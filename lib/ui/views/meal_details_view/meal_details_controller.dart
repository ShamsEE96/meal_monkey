import 'package:get/get.dart';
import 'package:meal_monkey/core/data/models/apis/meal_model.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/cart_view/cart_view.dart';
import 'package:meal_monkey/ui/views/main_view/main_controller.dart';

class MealDetailsController extends MainController {
  MealDetailsController({required MealModel mealModel}) {
    model = mealModel;
  }
  MealModel model = MealModel();
  RxInt count = 1.obs;
  RxDouble rating = 0.0.obs;

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
    return cartService.calcMealTotal(
      mealModel: model,
      count: count.value,
    );
  }

  void addToCart() {
    cartService.addToCartList(
      mealModel: model,
      count: count.value,
      afterAdd: () {
        Get.to(() => CartView());
      },
    );
  }

  // int mealTotalPrice(int price) {
  //   return price * count.value;
  // }

  // int mealCountChange() {
  //   return count.value;
  // }
}

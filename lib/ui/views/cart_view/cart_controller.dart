import 'package:get/get.dart';
import 'package:meal_monkey/core/data/models/cart_model.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:meal_monkey/ui/shared/utils.dart';

class CartController extends BaseController {
  RxList<CartModel> cartList = <CartModel>[].obs;
  RxDouble subTotal = 0.0.obs;
  RxDouble tax = 0.0.obs; // equals to subTotal * 0.18
  RxDouble deliveryFee = 0.0.obs; // equals to (subTotal + tax)*0.1
  RxDouble total = 0.0.obs;

  @override
  void onInit() {
    cartList.value = storage.getCartList();
    super.onInit();
  }

  double calcSubTotal() {
    cartList.forEach((element) {
      subTotal.value = subTotal.value + (element.total!).toDouble();
    });
    return subTotal.value;
  }

  double calcTax() {
    tax.value = (subTotal.value * 0.18).toDouble();
    return tax.value;
  }

  double calcDeliveryFee() {
    deliveryFee.value = ((subTotal.value + tax.value) * 0.1).toDouble();
    return deliveryFee.value;
  }

  double calcTotal() {
    total.value = subTotal.value + tax.value + deliveryFee.value;
    return total.value;
  }

  void removeFromCartList(CartModel model) {
    cartList.remove(model);
    storage.setCartList(cartList);
  }

  void changeCount(bool increase, CartModel model) {
    CartModel? result = cartList.firstWhere(
        (element) => element.mealModel!.id == model.mealModel!.id, orElse: () {
      return CartModel();
    });

    int index = cartList.indexOf(result);

    if (increase) {
      result.count = result.count! + 1;
      result.total = result.total! + model.mealModel!.price!.toDouble();
    } else {
      if (result.count! > 1) {
        result.count = result.count! - 1;
        result.total = result.total! - model.mealModel!.price!.toDouble();
      }
    }

    cartList.remove(result);
    cartList.insert(index, result);

    storage.setCartList(cartList);
  }
}

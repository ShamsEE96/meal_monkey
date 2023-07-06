import 'package:get/get.dart';
import 'package:meal_monkey/core/data/models/cart_model.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:meal_monkey/ui/shared/utils.dart';

class CartController extends BaseController {
  RxList<CartModel> cartList = cartService.cartList;
  @override
  void onInit() {
    super.onInit();
  }

  void removeFromCartList(CartModel cartModel) {
    cartService.removeFromCartList(
      cartModel: cartModel,
    );
  }

  void changeCount({
    required bool increase,
    required CartModel cartModel,
  }) {
    cartService.changeMealCount(
      increase: increase,
      cartModel: cartModel,
    );
  }

  //!---- First -----

  // RxDouble subTotal = 0.0.obs;
  // RxDouble tax = 0.0.obs;
  // RxDouble deliverFees = 0.0.obs;
  // RxDouble total = 0.0.obs;

  // void calcCartTotal() {
  //   subTotal.value = 0.0;
  //   tax.value = 0.0;
  //   deliverFees.value = 0.0;
  //   total.value = 0.0;

  //   subTotal.value = cartList.fold(
  //       0, (previousValue, element) => previousValue + element.total!);
  //   tax.value += subTotal.value * taxAmount;
  //   deliverFees.value += (subTotal.value + tax.value) * deliveryFeesAmount;
  //   total.value = subTotal.value + deliverFees.value + tax.value;
  // }

  // //!--- Second -----
  // double calcSubTotal() {
  //   return cartService.calcCartSubTotal();
  // }

  // double calcTax() {
  //   return cartService.calcCartTax();
  // }

  // double calcDeliveryFees() {
  //   return cartService.calcCartDeliveryFees();
  // }

  // double calcTotal() {
  //   return cartService.calcCartTotal();
  // }

  // void calcTotals() {
  //   calcSubTotal();
  //   calcTax();
  //   calcDeliveryFees();
  //   calcTotal();
  // }

  // //!--- Third ----
  // Map<String, double> calcTotals() {
  //   double subTotal = 0.0;
  //   double tax = 0.0;
  //   double deliverFees = 0.0;
  //   double total = 0.0;

  //   cartList.forEach((element) {
  //     subTotal += element.total ?? 0.0;
  //   });
  //   tax += subTotal * taxAmount;
  //   deliverFees += (subTotal + tax) * deliverAmount;
  //   total = subTotal + deliverFees + tax;

  //   return {
  //     "subTotal": subTotal,
  //     "tax": tax,
  //     "deliverFees": deliverFees,
  //     "total": total
  //   };
  // }
}

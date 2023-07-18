// import 'package:meal_monkey/core/data/models/apis/meal_model.dart';
// import 'package:meal_monkey/core/data/models/cart_model.dart';
// import 'package:meal_monkey/ui/shared/utils.dart';

// class CartService {
//   CartService({
//     required List<CartModel> cartList,
//   }) {
//     cartList = list;
//     cartAmount = list.length;
//   }

//   List<CartModel> list = [];
//   int? cartAmount;
//   MealModel meal = MealModel();

//   // void addToCartList() {
//   //   List<CartModel> list = this.list;

//   //   CartModel? result = list.firstWhere(
//   //     (element) => element.mealModel!.id == meal.id,
//   //     orElse: () {
//   //       return CartModel();
//   //     },
//   //   );

//   //   if (result.count != null) {
//   //     int index = list.indexOf(result);
//   //     list[index].count = list[index].count! + count.value;
//   //     list[index].total = list[index].total! + calcTotal();
//   //   } else {
//   //     list.add(
//   //       CartModel(
//   //         count: count.value,
//   //         total: calcTotal(),
//   //         mealModel: meal,
//   //       ),
//   //     );
//   //   }

//   //   storage.setCartList(list);
//   //   Get.to(CartView());
//   // }

//   // void removeFromCartList(CartModel model) {
//   //   cartList.remove(model);
//   //   storage.setCartList(cartList);
//   // }

//   void changeCount(bool increase, CartModel model) {
//     CartModel? result = list.firstWhere(
//         (element) => element.mealModel!.id == model.mealModel!.id, orElse: () {
//       return CartModel();
//     });

//     int index = list.indexOf(result);

//     if (increase) {
//       result.count = result.count! + 1;
//       result.total = result.total! + model.mealModel!.price!.toDouble();
//     } else {
//       if (result.count! > 1) {
//         result.count = result.count! - 1;
//         result.total = result.total! - model.mealModel!.price!.toDouble();
//       }
//     }

//     list.remove(result);
//     list.insert(index, result);

//     storage.setCartList(list);
//   }

//   double calcSubTotal() {
//     double subTotal = 0.0;
//     list.forEach((element) {
//       subTotal += element.total ?? 0.0;
//     });
//     return subTotal;
//   }

//   double calcTax() {
//     return calcSubTotal() * taxAmount;
//   }

//   double calcDeliveryFees() {
//     return (calcSubTotal() + calcTax()) * deliveryFeesAmount;
//   }

//   double calcTotal() {
//     return calcSubTotal() + calcTax() + calcDeliveryFees();
//   }
// }

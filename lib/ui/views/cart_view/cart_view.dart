import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/cart_view/cart_controller.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Obx(
              () {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.cartList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.cartList[index].mealModel!.name ?? '',
                              style: TextStyle(fontSize: screenWidth(10)),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.removeFromCartList(
                                    controller.cartList[index]);
                                // setState(() {});
                              },
                              icon: Icon(Icons.delete),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            CustomButton(
                              text: '-',
                              height: screenHeight(20),
                              width: screenWidth(6),
                              backgroundColor:
                                  controller.cartList[index].count == 1
                                      ? AppColors.placeholderGreyColor
                                      : AppColors.mainOrangeColor,
                              onPressed: controller.cartList[index].count == 1
                                  ? null
                                  : () {
                                      controller.changeCount(
                                        increase: false,
                                        cartModel: controller.cartList[index],
                                      );
                                    },
                            ),
                            (screenWidth(50)).pw,
                            CustomButton(
                              text:
                                  "${controller.cartList[index].count.toString()}",
                              textColor: AppColors.mainOrangeColor,
                              height: screenHeight(20),
                              width: screenWidth(6),
                              backgroundColor: AppColors.mainWhiteColor,
                              borderColor: AppColors.mainOrangeColor,
                              onPressed: () {},
                            ),
                            (screenWidth(50)).pw,
                            CustomButton(
                              text: '+',
                              height: screenHeight(20),
                              width: screenWidth(6),
                              onPressed: () {
                                controller.changeCount(
                                  increase: true,
                                  cartModel: controller.cartList[index],
                                );
                              },
                            ),
                          ],
                        ),
                        CustomText(
                          text: '${controller.cartList[index].total}',
                          fontSize: screenWidth(10),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      color: AppColors.mainOrangeColor,
                      width: screenWidth(1),
                      height: 2,
                    );
                  },
                );
              },
            ),
            Column(
              children: [
                CustomText(
                  text:
                      'SubTotal : ${cartService.subTotal.value.toStringAsFixed(2)}',
                ),
                CustomText(
                  text: 'Tax : ${cartService.tax.value.toStringAsFixed(2)}',
                ),
                CustomText(
                  text:
                      'Delivary Fee : ${cartService.deliverFees.value.toStringAsFixed(2)}',
                ),
                CustomText(
                  text: 'Total : ${cartService.total.value.toStringAsFixed(2)}',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

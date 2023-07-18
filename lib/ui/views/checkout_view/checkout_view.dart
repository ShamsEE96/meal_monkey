import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/checkout_view/checkout_controller.dart';
import 'package:meal_monkey/ui/views/main_view/main_view.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  void initState() {
    storage.setOrderPlaced(true);
    super.initState();
  }

  CheckoutController controller = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        cartService.clearCart();
        Get.off(() => MainView());

        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
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
              CustomButton(
                text: 'Continue Shopping',
                onPressed: () {
                  cartService.clearCart();
                  Get.off(() => MainView());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

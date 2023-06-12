import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/data/repositories/shared_preferences_repository.dart';
import 'package:meal_monkey/core/data/repositories/user_repository.dart';
import 'package:meal_monkey/core/enums/message_type.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
import 'package:meal_monkey/ui/views/main_view/main_view.dart';

class LoginController extends BaseController {
  TextEditingController emailController =
      TextEditingController(text: 'Test@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Test@1234');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  void login() {
    isLoading.value = true;
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      UserRepository()
          .login(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        value.fold((l) {
          isLoading.value = false;
          CustomToast.showMessage(
            messageType: MessageType.REJECTED,
            message: l,
          );
        }, (r) {
          SharedPreferencesRepository.setTokenInfo(r);
          //SharedPrefrenceRepository.setLoggedIn(true);
          Get.off(() => MainView());
        });
      });

      CustomToast.showMessage(
        message: 'Everything ok',
        messageType: MessageType.SUCCESS,
      );
    } else {
      CustomToast.showMessage(
        message: 'Error while connecting to server',
        messageType: MessageType.REJECTED,
      );
    }
  }
}

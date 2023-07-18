import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/data/repositories/user_repository.dart';
import 'package:meal_monkey/core/enums/message_type.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/login_view/login_view.dart';

class NewPasswordController extends BaseController {
  TextEditingController newPasswordController =
      TextEditingController(text: 'Shams@123');
  TextEditingController confirmPasswordController =
      TextEditingController(text: 'Shams@123');
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void newPassword() {
    if (formKey.currentState!.validate()) {
      runFutureFunctionWithFullLoading(
        function: UserRepository()
            .newPassword(
          email: storage.getResetPasswordEmail(),
          password: newPasswordController.text,
          confirmPassword: confirmPasswordController.text,
        )
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
              messageType: MessageType.REJECTED,
              message: l,
            );
          }, (r) {
            print(r);
            CustomToast.showMessage(
              message: r['title'],
              messageType: MessageType.SUCCESS,
            );
            Get.off(() => LoginView());
          });
        }),
      );

      // CustomToast.showMessage(
      //   message: tr('key_bot_toast_general_success'),
      //   messageType: MessageType.SUCCESS,
      // );
    } else {
      CustomToast.showMessage(
        message: 'Error while connecting to server',
        messageType: MessageType.REJECTED,
      );
    }
  }
}

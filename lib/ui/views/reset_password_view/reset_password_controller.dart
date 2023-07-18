import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/data/repositories/user_repository.dart';
import 'package:meal_monkey/core/enums/message_type.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:meal_monkey/core/translation/app_translation.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
import 'package:meal_monkey/ui/views/verification_code_view/verification_code_view.dart';

class ResetPasswordController extends BaseController {
  TextEditingController emailController =
      TextEditingController(text: 'wolfsh96@gmail.com');
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? emailSent;

  void forgotPassword() {
    if (formKey.currentState!.validate()) {
      runFutureFunctionWithFullLoading(
        function: UserRepository()
            .forgotPassword(
          email: emailController.text,
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
            Get.off(() => VerificationCodeView());
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

import 'package:flutter/material.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_navigator_shared.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:meal_monkey/ui/views/verification_code_view/verification_code_view.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.03,
            // horizontal: size.width * 0.01,
          ),
          child: Center(
            child: Column(
              children: [
                CustomText(
                  text: 'Reset Password',
                  textColor: AppColors.mainGreyColor,
                  fontSize: size.width * 0.1,
                ),
                (size.height * 0.04).ph,
                CustomText(
                  text:
                      'Please enter your email to receive a \n link to create a new password via email',
                  textColor: AppColors.secondaryGreyColor,
                ),
                (size.height * 0.1).ph,
                CustomTextFormField(
                  hintText: 'Email',
                  controller: emailController,
                  fillColor: AppColors.fillGreyColor,
                  hintTextColor: AppColors.placeholderGreyColor,
                  keyboardType: TextInputType.emailAddress,
                ),
                (size.height * 0.04).ph,
                CustomButton(
                  text: 'Send',
                  onPressed: () {
                    context.pushReplacement(VerificationCodeView());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

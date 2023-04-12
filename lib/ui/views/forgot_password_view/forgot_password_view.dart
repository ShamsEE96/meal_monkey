import 'package:flutter/material.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_navigator_shared.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:meal_monkey/ui/views/otp_view/otp_view.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
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
                MyCustomText(
                  myText: 'Reset Password',
                  myTextColor: AppColors.mainGreyColor,
                  fontSize: size.width * 0.1,
                ),
                (size.height * 0.04).ph,
                MyCustomText(
                  myText:
                      'Please enter your email to receive a \n link to create a new password via email',
                  myTextColor: AppColors.secondaryGreyColor,
                ),
                (size.height * 0.1).ph,
                CustomTextField(
                  myHintText: 'Email',
                  controller: emailController,
                  fillColor: AppColors.fillGreyColor,
                  hintTextColor: AppColors.placeholderGreyColor,
                  keyboardType: TextInputType.emailAddress,
                ),
                (size.height * 0.04).ph,
                CustomButton(
                  myButtonText: 'Send',
                  onPressed: () {
                    context.pushReplacement(OneTimePasscodeView());
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

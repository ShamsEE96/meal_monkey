import 'package:flutter/material.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_navigator_shared.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:meal_monkey/ui/views/login_view/login_view.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.03,
          ),
          child: Center(
            child: Column(
              children: [
                CustomText(
                  text: 'New Password',
                  textColor: AppColors.mainGreyColor,
                  fontSize: size.width * 0.1,
                ),
                (size.height * 0.02).ph,
                CustomText(
                  text:
                      'Please enter your email to receive a \n link to create a new password via email',
                  textColor: AppColors.secondaryGreyColor,
                ),
                (size.height * 0.06).ph,
                CustomTextFormField(
                  hintText: 'New Password',
                  controller: newPasswordController,
                  fillColor: AppColors.fillGreyColor,
                  hintTextColor: AppColors.placeholderGreyColor,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                (size.height * 0.04).ph,
                CustomTextFormField(
                  hintText: 'Confirm Password',
                  controller: confirmPasswordController,
                  fillColor: AppColors.fillGreyColor,
                  hintTextColor: AppColors.placeholderGreyColor,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                (size.height * 0.04).ph,
                CustomButton(
                  text: 'Next',
                  onPressed: () {
                    context.pushReplacement(LoginView());
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

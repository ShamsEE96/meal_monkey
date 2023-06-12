import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/login_view/login_view_controller.dart';
import 'package:meal_monkey/ui/views/reset_password_view/reset_password_view.dart';
import 'package:meal_monkey/ui/views/signup_view/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth(20),
              vertical: screenHeight(30),
            ),
            child: Column(
              children: [
                CustomText(
                  text: 'Login',
                  fontSize: screenWidth(10),
                  textColor: AppColors.mainGreyColor,
                ),
                (screenHeight(30)).ph,
                CustomText(
                  text: 'Add your details to login',
                  textColor: AppColors.secondaryGreyColor,
                ),
                (screenHeight(50)).ph,
                CustomTextFormField(
                  hintText: 'Your Email',
                  controller: controller.emailController,
                  validator: (value) {
                    if (value!.isEmpty || !isVaildEmail(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  fillColor: AppColors.fillGreyColor,
                  hintTextColor: AppColors.placeholderGreyColor,
                  keyboardType: TextInputType.emailAddress,
                ),
                (screenHeight(30)).ph,
                CustomTextFormField(
                  hintText: 'Password',
                  controller: controller.passwordController,
                  validator: (value) {
                    if (value!.isEmpty || !isVaildPassword(value)) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                  fillColor: AppColors.fillGreyColor,
                  hintTextColor: AppColors.placeholderGreyColor,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                (screenHeight(30)).ph,
                Obx(() {
                  return controller.isLoading.value
                      ? SpinKitThreeBounce(
                          color: AppColors.mainOrangeColor,
                        )
                      : CustomButton(
                          text: 'Login',
                          onPressed: () {
                            controller.login();
                          },
                        );
                }),
                (screenHeight(40)).ph,
                TextButton(
                  onPressed: () {
                    Get.to(() => ResetPasswordView());
                  },
                  child: CustomText(
                    text: 'Forgot your password?',
                    textColor: AppColors.mainOrangeColor,
                  ),
                ),
                (screenHeight(30)).ph,
                CustomText(
                  text: 'or Login With',
                  textColor: AppColors.secondaryGreyColor,
                ),
                (screenHeight(30)).ph,
                CustomButton(
                  text: 'Login with Facebook',
                  ImageName: 'ic_facebook',
                  onPressed: () {},
                  backgroundColor: AppColors.mainBlueColor,
                ),
                (screenHeight(30)).ph,
                CustomButton(
                  text: 'Login with Google',
                  ImageName: 'ic_google_plus_logo',
                  onPressed: () {},
                  backgroundColor: AppColors.mainRedColor,
                ),
                Spacer(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Don\'t have an Account? ',
                        textColor: AppColors.secondaryGreyColor,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => SignupView());
                        },
                        child: CustomText(
                          text: ' Sign Up',
                          textColor: AppColors.mainOrangeColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

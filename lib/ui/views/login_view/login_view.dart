import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/data/repositories/user_repository.dart';
import 'package:meal_monkey/core/enums/message_type.dart';
import 'package:meal_monkey/core/data/repositories/shared_preferences_repository.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_navigator_shared.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/login_view/login_controller.dart';
import 'package:meal_monkey/ui/views/main_view/main_view.dart';
import 'package:meal_monkey/ui/views/reset_password_view/reset_password_view.dart';
import 'package:meal_monkey/ui/views/signup_view/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController =
      TextEditingController(text: 'Test@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Test@1234');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'Login',
                      fontSize: size.width * 0.1,
                      textColor: AppColors.mainGreyColor,
                    ),
                    (size.height * 0.02).ph,
                    CustomText(
                      text: 'Add your details to login',
                      textColor: AppColors.secondaryGreyColor,
                    ),
                    (size.height * 0.04).ph,
                    CustomTextFormField(
                      hintText: 'Your Email',
                      controller: emailController,
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
                    (size.height * 0.02).ph,
                    CustomTextFormField(
                      hintText: 'Password',
                      controller: passwordController,
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
                    (size.height * 0.02).ph,
                    controller.isLoading.value
                        ? SpinKitThreeBounce(
                            color: AppColors.mainOrangeColor,
                          )
                        : CustomButton(
                            text: 'Login',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.isLoading.value = true;
                                UserRepository()
                                    .login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                )
                                    .then((value) {
                                  value.fold((l) {
                                    controller.isLoading.value = false;
                                    CustomToast.showMessage(
                                      messageType: MessageType.REJECTED,
                                      message: l,
                                    );
                                  }, (r) {
                                    SharedPreferencesRepository.setTokenInfo(r);
                                    //SharedPrefrenceRepository.setLoggedIn(true);
                                    Get.off(MainView());
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
                            },
                          ),
                    (size.height * 0.02).ph,
                    TextButton(
                      onPressed: () {
                        context.push(ResetPasswordView());
                      },
                      child: CustomText(
                        text: 'Forgot your password?',
                        textColor: AppColors.mainOrangeColor,
                      ),
                    ),
                    (size.height * 0.04).ph,
                    CustomText(
                      text: 'or Login With',
                      textColor: AppColors.secondaryGreyColor,
                    ),
                    (size.height * 0.02).ph,
                    CustomButton(
                      text: 'Login with Facebook',
                      ImageName: 'ic_facebook',
                      onPressed: () {},
                      backgroundColor: AppColors.mainBlueColor,
                    ),
                    (size.height * 0.02).ph,
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
                            text: 'Don\'t have an Account?',
                            textColor: AppColors.secondaryGreyColor,
                          ),
                          InkWell(
                            onTap: () {
                              context.push(SignupView());
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
      },
    );
  }
}

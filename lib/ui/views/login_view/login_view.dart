import 'package:flutter/material.dart';
import 'package:meal_monkey/data/enums/message_type.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_navigator_shared.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/forgot_password_view/forgot_password_view.dart';
import 'package:meal_monkey/ui/views/signup_view/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                MyCustomText(
                  myText: 'Login',
                  fontSize: size.width * 0.1,
                  myTextColor: AppColors.mainGreyColor,
                ),
                (size.height * 0.02).ph,
                MyCustomText(
                  myText: 'Add your details to login',
                  myTextColor: AppColors.secondaryGreyColor,
                ),
                (size.height * 0.04).ph,
                CustomTextField(
                  myHintText: 'Your Email',
                  controller: emailController,
                  myValidator: (value) {
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
                CustomTextField(
                  myHintText: 'Password',
                  controller: passwordController,
                  myValidator: (value) {
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
                CustomButton(
                  myButtonText: 'Login',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // BotToast.showText(text: 'Everything is ok');
                      CustomToast.showMessage(
                        size: size,
                        message: 'Everything ok',
                        messageType: MessageType.SUCCESS,
                      );
                    } else {
                      // BotToast.showText(text: 'xxxxx');
                      CustomToast.showMessage(
                        size: size,
                        message: 'Error while connecting to server',
                        messageType: MessageType.REJECTED,
                      );
                    }
                  },
                ),
                (size.height * 0.02).ph,
                TextButton(
                  onPressed: () {
                    context.push(ForgotPasswordView());
                  },
                  child: MyCustomText(
                    myText: 'Forgot your password?',
                    myTextColor: AppColors.mainOrangeColor,
                  ),
                ),
                (size.height * 0.04).ph,
                MyCustomText(
                  myText: 'or Login With',
                  myTextColor: AppColors.secondaryGreyColor,
                ),
                (size.height * 0.02).ph,
                CustomButton(
                  myButtonText: 'Login with Facebook',
                  myImageName: 'ic_facebook',
                  onPressed: () {},
                  backgroundColor: AppColors.mainBlueColor,
                ),
                (size.height * 0.02).ph,
                CustomButton(
                  myButtonText: 'Login with Google',
                  myImageName: 'ic_google_plus_logo',
                  onPressed: () {},
                  backgroundColor: AppColors.mainRedColor,
                ),
                Spacer(),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyCustomText(
                        myText: 'Don\'t have an Account?',
                        myTextColor: AppColors.secondaryGreyColor,
                      ),
                      InkWell(
                        onTap: () {
                          context.push(SignupView());
                        },
                        child: MyCustomText(
                          myText: 'Sign Up',
                          myTextColor: AppColors.mainOrangeColor,
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

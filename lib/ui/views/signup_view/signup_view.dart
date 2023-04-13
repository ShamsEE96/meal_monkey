import 'package:flutter/material.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_navigator_shared.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/login_view/login_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.width * 0.04,
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                MyCustomText(
                  myText: 'Sign Up',
                  myTextColor: AppColors.mainGreyColor,
                  fontSize: size.width * 0.1,
                ),
                (size.height * 0.02).ph,
                MyCustomText(
                  myText: 'Add your details to sign up',
                  myTextColor: AppColors.secondaryGreyColor,
                ),
                (size.height * 0.02).ph,
                CustomTextField(
                  myHintText: 'Name',
                  controller: nameController,
                  myValidator: (value) {
                    if (value!.isEmpty || !isVaildName(value)) {
                      return 'Enter a valid Name';
                    }
                    return null;
                  },
                  fillColor: AppColors.fillGreyColor,
                  hintTextColor: AppColors.placeholderGreyColor,
                  keyboardType: TextInputType.name,
                ),
                (size.height * 0.02).ph,
                CustomTextField(
                  myHintText: 'Email',
                  controller: emailController,
                  myValidator: (value) {
                    if (value!.isEmpty || !isVaildEmail(value)) {
                      return 'Please Enter a valid Email';
                    }
                    return null;
                  },
                  fillColor: AppColors.fillGreyColor,
                  hintTextColor: AppColors.placeholderGreyColor,
                  keyboardType: TextInputType.emailAddress,
                ),
                (size.height * 0.02).ph,
                CustomTextField(
                  myHintText: 'Mobile No',
                  controller: mobileNoController,
                  myValidator: (value) {
                    if (value!.isEmpty || !isVaildMobileNo(value)) {
                      return 'Please Enter a valid Mobile Number';
                    }
                    return null;
                  },
                  fillColor: AppColors.fillGreyColor,
                  hintTextColor: AppColors.placeholderGreyColor,
                  keyboardType: TextInputType.phone,
                ),
                (size.height * 0.02).ph,
                CustomTextField(
                  myHintText: 'Address',
                  controller: addressController,
                  myValidator: (value) {
                    if (value!.isEmpty || !isVaildName(value)) {
                      return 'Please Enter a vaild Address';
                    }
                    return null;
                  },
                  fillColor: AppColors.fillGreyColor,
                  hintTextColor: AppColors.placeholderGreyColor,
                  keyboardType: TextInputType.text,
                ),
                (size.height * 0.02).ph,
                CustomTextField(
                  myHintText: 'Password',
                  controller: passwordController,
                  myValidator: (value) {
                    if (value!.isEmpty || !isVaildPassword(value)) {
                      return 'Please Enter a valid password';
                    }
                    return null;
                  },
                  fillColor: AppColors.fillGreyColor,
                  hintTextColor: AppColors.placeholderGreyColor,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                (size.height * 0.02).ph,
                CustomTextField(
                  myHintText: 'Confirm Password',
                  controller: confirmPasswordController,
                  myValidator: (value) {
                    if (value!.isEmpty || !isVaildPassword(value)) {
                      return 'Please Enter a valid password ';
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                      return 'make sure your password match';
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
                  myButtonText: 'Sign Up',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // context.pushReplacement(LoginView());
                    }
                  },
                ),
                (size.height * 0.02).ph,
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyCustomText(
                        myText: 'Already have an Account? ',
                        myTextColor: AppColors.secondaryGreyColor,
                      ),
                      InkWell(
                        onTap: () {
                          context.pushReplacement(LoginView());
                        },
                        child: MyCustomText(
                          myText: 'Login',
                          myTextColor: AppColors.mainOrangeColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

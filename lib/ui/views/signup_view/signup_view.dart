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
        body: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.width * 0.04,
              ),
              child: Column(
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
                    fillColor: AppColors.fillGreyColor,
                    hintTextColor: AppColors.placeholderGreyColor,
                  ),
                  (size.height * 0.02).ph,
                  CustomTextField(
                    myHintText: 'Email',
                    controller: emailController,
                    myValidator: (value) {
                      if (value!.isEmpty || !isVaildEmail(value)) {
                        return 'Please a valid email';
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
                    fillColor: AppColors.fillGreyColor,
                    hintTextColor: AppColors.placeholderGreyColor,
                    keyboardType: TextInputType.phone,
                  ),
                  (size.height * 0.02).ph,
                  CustomTextField(
                    myHintText: 'Address',
                    controller: addressController,
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
                        return 'Please a valid password';
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
                      if (value!.isEmpty ||
                          passwordController.text !=
                              confirmPasswordController.text ||
                          !isVaildPassword(value)) {
                        return 'Please a valid password';
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
                        context.pushReplacement(LoginView());
                      }
                      // if (nameController.text.isEmpty) {
                      //   print('Please enter your name');
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('Please enter your name')),
                      //   );
                      // } else if (emailController.text.isEmpty) {
                      //   print('Please enter your email');
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('Please enter your email')),
                      //   );
                      // } else if (mobileNoController.text.isEmpty) {
                      //   print('Please enter your mobile number');
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //         content: Text('Please enter your mobile number')),
                      //   );
                      // } else if (addressController.text.isEmpty) {
                      //   print('Please enter your address');
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('Please enter your address')),
                      //   );
                      // } else if (passwordController.text.isEmpty) {
                      //   print('Please enter your password');
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('Please enter your password')),
                      //   );
                      // } else if (confirmPasswordController.text.isEmpty) {
                      //   print('Please confirm your password');
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('Please enter your password')),
                      //   );
                      // } else if (!isVaildName(nameController.text)) {
                      //   print('name is not valid');
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('name is not valid')),
                      //   );
                      // } else if (!isVaildEmail(emailController.text)) {
                      //   print('email is not valid');
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('email is not valid')),
                      //   );
                      // } else if (!isVaildMobileNo(mobileNoController.text)) {
                      //   print('mobile number is not valid');
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('mobile number is not valid')),
                      //   );
                      // } else if (!isVaildPassword(passwordController.text)) {
                      //   print('password is not valid');
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(content: Text('password is not valid')));
                      // } else if (passwordController.text !=
                      //     confirmPasswordController.text) {
                      //   print('password does not match');
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(content: Text('password does not match')));
                      // }
                      // // context.pushReplacement(LoginView());
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
                        TextButton(
                          onPressed: () {
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
          ],
        ),
      ),
    );
  }
}

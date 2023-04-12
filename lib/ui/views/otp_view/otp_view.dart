import 'package:flutter/material.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_navigator_shared.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/views/forgot_password_view/forgot_password_view.dart';
import 'package:meal_monkey/ui/views/new_password_view/new_password_view.dart';
import 'package:meal_monkey/ui/views/otp_view/otp_view_widgets/otp_text_form_field.dart';

class OneTimePasscodeView extends StatelessWidget {
  const OneTimePasscodeView({super.key});

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
          child: Column(
            children: [
              MyCustomText(
                myText: 'We have Sent an OTP to \n your Mobile',
                myTextColor: AppColors.mainGreyColor,
                fontSize: size.width * 0.08,
              ),
              (size.height * 0.02).ph,
              MyCustomText(
                myText:
                    'Please check your mobile number \n continue to reset your password',
                myTextColor: AppColors.secondaryGreyColor,
              ),
              (size.height * 0.08).ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OneTimePasscodeTextFormField(
                    fillColor: AppColors.fillGreyColor,
                    hintTextColor: AppColors.placeholderGreyColor,
                    myHintText: '*',
                  ),
                  OneTimePasscodeTextFormField(
                    fillColor: AppColors.fillGreyColor,
                    hintTextColor: AppColors.placeholderGreyColor,
                    myHintText: '*',
                  ),
                  OneTimePasscodeTextFormField(
                    fillColor: AppColors.fillGreyColor,
                    hintTextColor: AppColors.placeholderGreyColor,
                    myHintText: '*',
                  ),
                  OneTimePasscodeTextFormField(
                    fillColor: AppColors.fillGreyColor,
                    hintTextColor: AppColors.placeholderGreyColor,
                    myHintText: '*',
                  ),
                ],
              ),
              (size.height * 0.06).ph,
              CustomButton(
                myButtonText: 'Next',
                onPressed: () {
                  context.pushReplacement(NewPasswordView());
                },
              ),
              (size.height * 0.04).ph,
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyCustomText(
                      myText: 'Didn\'t Receive?',
                      myTextColor: AppColors.secondaryGreyColor,
                    ),
                    TextButton(
                      onPressed: () {
                        context.push(ForgotPasswordView());
                      },
                      child: MyCustomText(
                        myText: 'Click Here',
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
    );
  }
}

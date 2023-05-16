import 'package:flutter/material.dart';
import 'package:meal_monkey/core/enums/message_type.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_navigator_shared.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/views/reset_password_view/reset_password_view.dart';
import 'package:meal_monkey/ui/views/new_password_view/new_password_view.dart';
import 'package:meal_monkey/ui/views/verification_code_view/verification_code_view_widgets/verification_code_view_text_form_field.dart';

class VerificationCodeView extends StatefulWidget {
  const VerificationCodeView({super.key});

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
  int length = 4;
  List<String> otpCode = [];
  late List<Widget> otpList;
  List<FocusNode> focusNodeList = List.generate(4, (index) => FocusNode());
  List<TextEditingController> controllerList =
      List.generate(4, (index) => TextEditingController());

  void enterOTP(String value, int index) {
    if (index != otpList.length - 1 && value.length == 1) {
      // FocusScope.of(context).nextFocus();
      FocusScope.of(context).requestFocus(focusNodeList[index + 1]);
    }
    saveDataToList(value, index);
  }

  void saveDataToList(String value, int index) {
    if (index <= controllerList.length) {
      otpCode.add(controllerList[index].text);
    }
  }

  void sendData(Size size) {
    if (otpCode.length == 4) {
      CustomToast.showMessage(
        size: size,
        message: 'OTP Correct',
        messageType: MessageType.SUCCESS,
      );
      Future.delayed(Duration(seconds: 2)).then(
        (value) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NewPasswordView(),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    controllerList.forEach((controller) => controller.dispose());
    focusNodeList.forEach((node) => node.dispose());
    super.dispose();
  }

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
                children: otpList = List.generate(
                  length,
                  (index) => OneTimePasscodeTextFormField(
                    fillColor: AppColors.fillGreyColor,
                    hintTextColor: AppColors.placeholderGreyColor,
                    focusNode: focusNodeList[index],
                    autoFocus: index == 0 ? true : false,
                    controller: controllerList[index],
                    obscureText: true,
                    onChanged: (value) {
                      enterOTP(value, index);
                      sendData(size);
                    },
                  ),
                ),
              ),
              (size.height * 0.06).ph,
              Text('Your Code is : ${otpCode.join()} '),
              (size.height * 0.06).ph,
              CustomButton(
                myButtonText: 'Next',
                onPressed: () {},
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
                        context.push(ResetPasswordView());
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

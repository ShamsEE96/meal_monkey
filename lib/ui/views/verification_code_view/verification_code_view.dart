import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:meal_monkey/data/enums/message_type.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_navigator_shared.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/views/reset_password_view/reset_password_view.dart';
import 'package:meal_monkey/ui/views/new_password_view/new_password_view.dart';
import 'package:meal_monkey/ui/views/verification_code_view/verification_code_view_widgets/verification_code_view_text_form_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// class VerificationCodeView extends StatelessWidget {
//   const VerificationCodeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             PinCodeTextField(
//               length: 4,
//               obscureText: true,
//               animationType: AnimationType.fade,
//               pinTheme: PinTheme(
//                 shape: PinCodeFieldShape.box,
//                 borderRadius: BorderRadius.circular(5),
//                 fieldHeight: 50,
//                 fieldWidth: 40,
//                 activeFillColor: AppColors.mainWhiteColor,
//               ),
//               animationDuration: Duration(milliseconds: 300),
//               backgroundColor: AppColors.mainGreyColor,
//               enableActiveFill: true,
//               errorAnimationController: errorController,
//               controller: textEditingController,
//               onCompleted: (v) {
//                 print("Completed");
//               },
//               onChanged: (value) {
//                 print(value);
//               },
//               beforeTextPaste: (text) {
//                 print("Allowing to paste $text");
//                 //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
//                 //but you can show anything you want here, like your pop up saying wrong paste format or etc
//                 return true;
//               }, appContext: context,
//             )
//           ],
//         ),
//       ),

//     );
//   }
// }

class VerificationCodeView extends StatefulWidget {
  const VerificationCodeView({super.key});

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
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

  // @override
  // void dispose() {
  //   // dispose of the TextEditingController and FocusNode objects
  //   controllerList.forEach((controller) => controller.dispose());
  //   focusNodeList.forEach((node) => node.dispose());
  //   super.dispose();
  // }

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
                  4,
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
                      // otpList[index] != (otpList.length - 1)
                      //     ? moveFocus(value, context)
                      //     : sendData(value, context);
                      // setState(() {
                      //   otpList[index] != (otpList.length - 1)
                      //       ? moveFocus(value, context)
                      //       : sendData(value, context);
                      // });
                    },
                  ),
                ),
              ),
              (size.height * 0.06).ph,
              Text('Your Code is : ${otpCode.join()} '),
              (size.height * 0.06).ph,
              CustomButton(
                myButtonText: 'Next',
                onPressed: () {
                  // setState(() {
                  //   // controllerList.forEach((element) {
                  //   //   otpCode = otpCode + element.text;
                  //   // });
                  // });
                  // sendData(value);
                  // context.pushReplacement(NewPasswordView());
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







                  // OneTimePasscodeTextFormField(
                  //   fillColor: AppColors.fillGreyColor,
                  //   hintTextColor: AppColors.placeholderGreyColor,
                  //   myHintText: '*',
                  // ),
                  // OneTimePasscodeTextFormField(
                  //   fillColor: AppColors.fillGreyColor,
                  //   hintTextColor: AppColors.placeholderGreyColor,
                  //   myHintText: '*',
                  // ),
                  // OneTimePasscodeTextFormField(
                  //   fillColor: AppColors.fillGreyColor,
                  //   hintTextColor: AppColors.placeholderGreyColor,
                  //   myHintText: '*',
                  // ),
                  // OneTimePasscodeTextFormField(
                  //   fillColor: AppColors.fillGreyColor,
                  //   hintTextColor: AppColors.placeholderGreyColor,
                  //   myHintText: '*',
                  // ),
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meal_monkey/core/data/models/file_type_model.dart';
import 'package:meal_monkey/core/data/repositories/user_repository.dart';
import 'package:meal_monkey/core/enums/file_type.dart';
import 'package:meal_monkey/core/enums/message_type.dart';
import 'package:meal_monkey/core/utils/file_utils.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
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
  TextEditingController firstnameController =
      TextEditingController(text: 'ShamsEE');
  TextEditingController lastnameController =
      TextEditingController(text: 'Shams');
  // TextEditingController mobileNoController = TextEditingController();
  TextEditingController ageController = TextEditingController(text: '26');
  TextEditingController emailController =
      TextEditingController(text: 'shams@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Shams@123');
  TextEditingController confirmPasswordController =
      TextEditingController(text: 'Shams@123');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final ImagePicker picker = ImagePicker();
  FileTypeModel? selectedFile;
  bool showOptions = false;
  bool isLoading = false;

  void setShowOption(bool value) {
    setState(() {
      showOptions = value;
    });
  }

  void showBottomSheet() => showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(20),
            topEnd: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                Icons.camera_alt,
                color: AppColors.mainOrangeColor,
              ),
              title: CustomText(
                text: 'Camera',
                textAlign: TextAlign.start,
              ),
              onTap: () {
                FileUtil.pickFile(FileTypeEnum.CAMERA)
                    .then((value) => setState(() {
                          selectedFile = value;
                        }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.image,
                color: AppColors.mainOrangeColor,
              ),
              title: CustomText(
                text: 'Gallery',
                textAlign: TextAlign.start,
              ),
              onTap: () {
                FileUtil.pickFile(FileTypeEnum.GALLERY)
                    .then((value) => setState(() {
                          selectedFile = value;
                        }));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.file_open,
                color: AppColors.mainOrangeColor,
              ),
              title: CustomText(
                text: 'File',
                textAlign: TextAlign.start,
              ),
              onTap: () {
                FileUtil.pickFile(FileTypeEnum.FILE)
                    .then((value) => setState(() {
                          selectedFile = value;
                        }));
              },
            )
          ],
        ),
      );

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
                CustomText(
                  text: 'Sign Up',
                  textColor: AppColors.mainGreyColor,
                  fontSize: size.width * 0.1,
                ),
                (size.height * 0.02).ph,
                CustomText(
                  text: 'Add your details to sign up',
                  textColor: AppColors.secondaryGreyColor,
                ),
                (size.height * 0.02).ph,
                Center(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      InkWell(
                        onTap: selectedFile == null
                            ? () {
                                showBottomSheet();
                              }
                            : null,
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child:
                              selectedFile == null || selectedFile!.path.isEmpty
                                  ? Icon(
                                      Icons.image,
                                      color: AppColors.mainWhiteColor,
                                    )
                                  : selectedFile!.type != FileTypeEnum.FILE
                                      ? Image.file(
                                          File(selectedFile!.path),
                                          fit: BoxFit.cover,
                                        )
                                      : Icon(
                                          Icons.file_copy,
                                          color: AppColors.mainWhiteColor,
                                        ),
                          width: (size.width / 100) * 42,
                          height: (size.width / 100) * 42,
                          decoration: BoxDecoration(
                            color: AppColors.mainOrangeColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      // InkWell(
                      //   onTap: selectedFile == null
                      //       ? () {
                      //           showBottomSheet();
                      //         }
                      //       : null,
                      //   child: CircleAvatar(
                      //     backgroundColor: AppColors.mainOrangeColor,
                      //     radius: size.width / 4,
                      //     child:
                      //         selectedFile == null || selectedFile!.path.isEmpty
                      //             ? Icon(Icons.image)
                      //             : selectedFile!.type != FileTypeEnum.FILE
                      //                 ? Image.file(File(selectedFile!.path))
                      //                 : Icon(Icons.file_copy),
                      //   ),
                      // ),
                      Visibility(
                        visible: selectedFile != null,
                        child: InkWell(
                          onTap: () {
                            showBottomSheet();
                          },
                          child: CircleAvatar(
                            backgroundColor: AppColors.mainOrangeColor,
                            child: Icon(
                              Icons.edit,
                              color: AppColors.mainWhiteColor,
                            ),
                            radius: size.width / 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                (size.height * 0.02).ph,
                CustomTextFormField(
                  hintText: 'First Name',
                  controller: firstnameController,
                  validator: (value) {
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
                CustomTextFormField(
                  hintText: 'Last Name',
                  controller: lastnameController,
                  validator: (value) {
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
                // CustomTextFormField(
                //   hintText: 'Mobile No',
                //   controller: mobileNoController,
                //   validator: (value) {
                //     if (value!.isEmpty || !isVaildMobileNo(value)) {
                //       return 'Please Enter a valid Mobile Number';
                //     }
                //     return null;
                //   },
                //   fillColor: AppColors.fillGreyColor,
                //   hintTextColor: AppColors.placeholderGreyColor,
                //   keyboardType: TextInputType.phone,
                // ),
                // (size.height * 0.02).ph,
                CustomTextFormField(
                  hintText: 'Age',
                  controller: ageController,
                  validator: (value) {
                    if (value!.isEmpty || int.parse(value) < 18) {
                      return 'Please Enter a vaild Age';
                    }
                    return null;
                  },
                  fillColor: AppColors.fillGreyColor,
                  hintTextColor: AppColors.placeholderGreyColor,
                  keyboardType: TextInputType.text,
                ),
                (size.height * 0.02).ph,
                CustomTextFormField(
                  hintText: 'Email',
                  controller: emailController,
                  validator: (value) {
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
                CustomTextFormField(
                  hintText: 'Password',
                  controller: passwordController,
                  validator: (value) {
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
                CustomTextFormField(
                  hintText: 'Confirm Password',
                  controller: confirmPasswordController,
                  validator: (value) {
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
                isLoading
                    ? SpinKitThreeBounce(
                        color: AppColors.mainOrangeColor,
                      )
                    : CustomButton(
                        text: 'Sign Up',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            UserRepository()
                                .register(
                                  email: emailController.text,
                                  firstname: firstnameController.text,
                                  lastname: lastnameController.text,
                                  age: int.parse(ageController.text),
                                  password: passwordController.text,
                                  photoPath: selectedFile?.path ?? '',
                                )
                                .then(
                                  (value) => value.fold(
                                    (l) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      CustomToast.showMessage(
                                        messageType: MessageType.REJECTED,
                                        message: l,
                                      );
                                    },
                                    (r) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return LoginView();
                                          },
                                        ),
                                      );
                                    },
                                  ),
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
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Already have an Account? ',
                        textColor: AppColors.secondaryGreyColor,
                      ),
                      InkWell(
                        onTap: () {
                          context.pushReplacement(LoginView());
                        },
                        child: CustomText(
                          text: 'Login',
                          textColor: AppColors.mainOrangeColor,
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

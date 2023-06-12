import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/data/models/file_type_model.dart';
import 'package:meal_monkey/core/services/base_controller.dart';

class SignupController extends BaseController {
  TextEditingController firstnameController =
      TextEditingController(text: 'ShamsEE');
  TextEditingController lastnameController =
      TextEditingController(text: 'Shams');
  TextEditingController ageController = TextEditingController(text: '26');
  TextEditingController emailController =
      TextEditingController(text: 'shams@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Shams@123');
  TextEditingController confirmPasswordController =
      TextEditingController(text: 'Shams@123');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // final ImagePicker picker = ImagePicker();
  FileTypeModel? selectedFile;
  RxBool showOptions = false.obs;
  RxBool isLoading = false.obs;
}

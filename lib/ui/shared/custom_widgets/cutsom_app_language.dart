import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/app/my_app.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/utils.dart';

class CustomAppLanguage extends StatefulWidget {
  const CustomAppLanguage({super.key});

  @override
  State<CustomAppLanguage> createState() => _CustomAppLanguageState();
}

class _CustomAppLanguageState extends State<CustomAppLanguage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.defaultDialog(
          title: 'Choose App Language',
          content: Column(
            children: [
              InkWell(
                onTap: () {
                  storage.setAppLanguage('en');
                  Get.updateLocale(getLocale());
                  Get.back();
                },
                child: CustomText(text: 'English'),
              ),
              (screenWidth(20)).ph,
              InkWell(
                onTap: () {
                  storage.setAppLanguage('ar');
                  Get.updateLocale(getLocale());
                  Get.back();
                },
                child: CustomText(text: 'العربية'),
              ),
              (screenWidth(20)).ph,
              InkWell(
                onTap: () {
                  storage.setAppLanguage('tr');
                  Get.updateLocale(getLocale());
                  Get.back();
                },
                child: CustomText(text: 'Türkçe'),
              ),
            ],
          ),
        );
      },
      child: Icon(
        Icons.language,
        color: AppColors.mainOrangeColor,
      ),
    );
  }
}

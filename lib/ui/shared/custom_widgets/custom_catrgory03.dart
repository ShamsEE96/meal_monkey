import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';

class CustomCategory03 extends StatelessWidget {
  const CustomCategory03({
    super.key,
    required this.imageUrl,
    required this.text,
    this.textColor,
  });
  final String imageUrl;
  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width / 4,
            height: size.width / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => SizedBox(
                  width: size.width / 10,
                  height: size.width / 10,
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          (size.width / 20).pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                textAlign: TextAlign.start,
                text: text,
                // text: mealList[index].name ?? '',
                textColor: textColor ?? AppColors.mainGreyColor,
                fontSize: size.width / 17,
                fontWeight: FontWeight.bold,
              ),
              (size.width / 35).ph,
              Row(
                children: [
                  CustomText(
                    text: 'Café  ',
                    textColor: AppColors.placeholderGreyColor,
                    // fontSize: ,
                  ),
                  CustomText(
                    text: ' . ',
                    textColor: AppColors.mainOrangeColor,
                    // fontSize: ,
                  ),
                  CustomText(
                    text: 'Western Food',
                    textColor: AppColors.placeholderGreyColor,
                    // fontSize: ,
                  ),
                  (size.width / 6).pw,
                ],
              ),
              (size.width / 35).ph,
              Row(
                children: [
                  SvgPicture.asset(
                    'images/ic_star.svg',
                    color: AppColors.mainOrangeColor,
                    width: size.width / 18,
                    height: size.width / 18,
                  ),
                  CustomText(
                    text: ' 4.9 ',
                    textColor: AppColors.mainOrangeColor,
                    // fontSize: ,
                  ),
                  (size.width / 35).pw,
                  CustomText(
                    text: '(124 ratings)',
                    textColor: AppColors.placeholderGreyColor,
                    // fontSize: ,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

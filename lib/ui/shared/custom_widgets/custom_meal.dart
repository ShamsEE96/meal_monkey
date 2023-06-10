import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';

class CustomMeal extends StatelessWidget {
  const CustomMeal({
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: size.height / 3,
          width: size.width,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrl,
            // imageUrl: mealList[index].images!.length > 0
            //     ? getFullImageUrl(mealList[index].images![0])
            //     : '',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        (size.width / 30).ph,
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width / 22,
          ),
          child: CustomText(
            text: text,
            // text: mealList[index].name ?? '',
            textColor: textColor ?? AppColors.mainGreyColor,
            fontSize: size.width / 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        (size.width / 30).ph,
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width / 22,
          ),
          child: Row(
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
              CustomText(
                text: '(124 ratings) Café',
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
              )
            ],
          ),
        )
      ],
    );
  }
}

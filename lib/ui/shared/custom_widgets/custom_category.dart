import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({
    super.key,
    required this.imageUrl,
    required this.text,
  });
  final String imageUrl;
  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                placeholder: (context, url) => SizedBox(
                  width: size.width / 10,
                  height: size.width / 10,
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          (size.height / 100).ph,
          CustomText(
            text: text,
            fontWeight: FontWeight.bold,
            textColor: AppColors.mainGreyColor,
          ),
        ],
      ),
    );
  }
}

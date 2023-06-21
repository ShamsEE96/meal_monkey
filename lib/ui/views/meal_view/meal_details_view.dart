import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/data/models/apis/meal_model.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/meal_view/meal_details_view_controller.dart';

class MealDetailsView extends StatefulWidget {
  MealDetailsView({
    super.key,
    required this.selecetedMeal,
  });

  final MealModel selecetedMeal;

  @override
  State<MealDetailsView> createState() => _MealDetailsViewState();
}

class _MealDetailsViewState extends State<MealDetailsView> {
  late MealDetailsController controller;
  @override
  void initState() {
    controller = MealDetailsController(mealModel: widget.selecetedMeal);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: widget.selecetedMeal.images![0],
              // imageUrl: mealList[index].images!.length > 0
              //     ? getFullImageUrl(mealList[index].images![0])
              //     : '',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            CustomText(text: controller.model.name ?? "no name found"),
            CustomText(text: '${controller.model.price}'),
            CustomText(
                text: controller.model.description ?? "no description found"),
            Obx(
              () => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(
                    text: '-',
                    width: screenWidth(9),
                    backgroundColor: controller.count.value == 1
                        ? AppColors.placeholderGreyColor
                        : AppColors.mainOrangeColor,
                    onPressed: controller.count.value == 1
                        ? null
                        : () {
                            controller.changeCount(false);
                          },
                  ),
                  CustomText(text: "${controller.count.value}"),
                  CustomButton(
                    text: '+',
                    width: screenWidth(9),
                    onPressed: () {
                      controller.changeCount(true);
                    },
                  ),
                ],
              ),
            ),
            Obx(
              () => CustomText(
                text: '${controller.calcTotal()}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

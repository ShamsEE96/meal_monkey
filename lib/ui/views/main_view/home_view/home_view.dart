import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/core/data/models/apis/category_model.dart';
import 'package:meal_monkey/core/data/models/apis/meal_model.dart';
import 'package:meal_monkey/core/data/repositories/category_repository.dart';
import 'package:meal_monkey/core/data/repositories/meal_repository.dart';
import 'package:meal_monkey/core/enums/message_type.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_category.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_category02.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_catrgory03.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_meal.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.onMenuTap});
  final Function onMenuTap;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController searchController = TextEditingController();
  List<CategoryModel> categoryList = [];
  List<MealModel> mealList = [];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          top: size.width / 25,
          bottom: size.width / 3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width / 22,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Good morning Akila!',
                    textColor: AppColors.mainGreyColor,
                    fontSize: size.width / 15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'images/ic_shopping_cart.svg',
                      color: AppColors.mainOrangeColor,
                      width: size.width / 12,
                      height: size.width / 12,
                    ),
                  ),
                ],
              ),
            ),
            (size.width / 20).ph,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width / 22,
              ),
              child: CustomText(
                text: 'Delivering to',
                textColor: AppColors.placeholderGreyColor,
                fontSize: size.width / 30,
              ),
            ),
            (size.width / 30).ph,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width / 22,
              ),
              child: CustomText(
                text: 'Current Location',
                textColor: AppColors.placeholderGreyColor,
                fontSize: size.width / 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            (size.width / 15).ph,
            Center(
              child: CustomTextFormField(
                hintText: 'Search food',
                controller: searchController,
                fillColor: AppColors.fillGreyColor,
                hintTextColor: AppColors.placeholderGreyColor,
                prefixIcon: Icon(Icons.search),
                prefixIconColor: AppColors.secondaryGreyColor,
              ),
            ),
            (size.width / 15).ph,
            SizedBox(
              height: size.height / 4,
              // height: size.width / 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width / 22,
                ),
                child: FutureBuilder(
                  future: CategoryRepository().getAll(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      snapshot.data!.fold(
                        (l) {
                          CustomToast.showMessage(
                            message: l,
                            messageType: MessageType.REJECTED,
                          );
                        },
                        (r) {
                          categoryList.clear();
                          categoryList.addAll(r);
                        },
                      );
                    }
                    return snapshot.data == null
                        ? SpinKitCircle(
                            color: AppColors.mainOrangeColor,
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: categoryList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomCategory(
                                imageUrl: categoryList[index].logo ??
                                    "https://training.owner-tech.com/Images/91b43499-de8b-4d6d-9af8-3f18872bdc5c.png",
                                text: categoryList[index].name ?? '',
                              );
                            },
                          );
                  },
                ),
              ),
            ),
            (size.width / 10).ph,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width / 22,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Popular Restaurents',
                    textColor: AppColors.mainGreyColor,
                    fontSize: size.width / 15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: CustomText(
                      text: 'View all',
                      textColor: AppColors.mainOrangeColor,
                      fontSize: size.width / 25,
                    ),
                  ),
                ],
              ),
            ),
            (size.width / 20).ph,
            FutureBuilder(
              future: MealRepository().getAll(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  snapshot.data!.fold(
                    (l) {
                      CustomToast.showMessage(
                        message: l,
                        messageType: MessageType.REJECTED,
                      );
                    },
                    (r) {
                      mealList.clear();
                      mealList.addAll(r);
                    },
                  );
                }
                return snapshot.data == null
                    ? SpinKitCircle(
                        color: AppColors.mainOrangeColor,
                      )
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: mealList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomMeal(
                              imageUrl: mealList[index].images!.length > 0
                                  ? getFullImageUrl(mealList[index].images![0])
                                  : '',
                              text: mealList[index].name ?? '');
                        },
                      );
              },
            ),
            (size.width / 10).ph,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width / 22,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Most Popular',
                    textColor: AppColors.mainGreyColor,
                    fontSize: size.width / 15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: CustomText(
                      text: 'View all',
                      textColor: AppColors.mainOrangeColor,
                      fontSize: size.width / 25,
                    ),
                  ),
                ],
              ),
            ),
            (size.width / 20).ph,
            SizedBox(
              height: size.height / 2,
              // height: size.width / 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width / 22,
                ),
                child: FutureBuilder(
                  future: CategoryRepository().getAll(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      snapshot.data!.fold(
                        (l) {
                          CustomToast.showMessage(
                            message: l,
                            messageType: MessageType.REJECTED,
                          );
                        },
                        (r) {
                          categoryList.clear();
                          categoryList.addAll(r);
                        },
                      );
                    }
                    return snapshot.data == null
                        ? SpinKitCircle(
                            color: AppColors.mainOrangeColor,
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: categoryList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomCategory02(
                                imageUrl:
                                    "https://training.owner-tech.com/Images/91b43499-de8b-4d6d-9af8-3f18872bdc5c.png",
                                text: categoryList[index].name ?? '',
                              );
                            },
                          );
                  },
                ),
              ),
            ),
            (size.width / 10).ph,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width / 22,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Recent Items',
                    textColor: AppColors.mainGreyColor,
                    fontSize: size.width / 15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: CustomText(
                      text: 'View all',
                      textColor: AppColors.mainOrangeColor,
                      fontSize: size.width / 25,
                    ),
                  ),
                ],
              ),
            ),
            (size.width / 20).ph,
            (size.width / 20).ph,
            SizedBox(
              height: size.height / 2,
              // height: size.width / 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width / 22,
                ),
                child: FutureBuilder(
                  future: CategoryRepository().getAll(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      snapshot.data!.fold(
                        (l) {
                          CustomToast.showMessage(
                            message: l,
                            messageType: MessageType.REJECTED,
                          );
                        },
                        (r) {
                          categoryList.clear();
                          categoryList.addAll(r);
                        },
                      );
                    }
                    return snapshot.data == null
                        ? SpinKitCircle(
                            color: AppColors.mainOrangeColor,
                          )
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: categoryList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomCategory03(
                                imageUrl:
                                    "https://training.owner-tech.com/Images/91b43499-de8b-4d6d-9af8-3f18872bdc5c.png",
                                text: categoryList[index].name ?? '',
                              );
                            },
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           "Home View",
//           style: TextStyle(
//             fontSize: 25,
//           ),
//         ),
//         (size.width / 13).ph,
//         CustomButton(
//           text: 'Open Drawer',
//           onPressed: () {
//             widget.onMenuTap();
//           },
//         ),
//         (size.width / 13).ph,
//         CustomButton(
//           text: 'Get Categories',
//           onPressed: () {
//             CategoryRepository().getAll();
//           },
//         ),
//       ],
//     );
//   }
// }

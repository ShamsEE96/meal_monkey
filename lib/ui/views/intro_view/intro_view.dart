import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/views/landing_view/landing_view.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  List<String> titleList = [
    'Find Food You Love',
    'Fast Delivery',
    'Live Tracking'
  ];
  List<String> descriptionList = [
    'Discover the best foods from over 1,000 \n restaurants and fast delivery to your doorstep',
    'Fast food delivery to your home, office \n wherever you are',
    'Real time tracking of your food on the app \n once you placed the order,'
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              (size.width / 11).ph,
              SvgPicture.asset(
                'images/intro$currentIndex.svg',
                height: size.width * 0.75,
                width: size.width * 0.75,
              ),
              (size.width / 20).ph,
              DotsIndicator(
                dotsCount: 3,
                position: currentIndex.toDouble(),
                decorator: DotsDecorator(
                  color: AppColors.mainGreyColor,
                  activeColor: AppColors.mainOrangeColor,
                ),
              ),
              (size.width / 11).ph,
              MyCustomText(
                myText: titleList[currentIndex],
                fontSize: size.width * 0.1,
                myTextColor: AppColors.mainGreyColor,
              ),
              (size.width / 11).ph,
              MyCustomText(
                myText: descriptionList[currentIndex],
                myTextColor: AppColors.secondaryGreyColor,
              ),
              (size.width / 11).ph,
              CustomButton(
                myButtonText: currentIndex != 2 ? 'Next' : 'Finish',
                onPressed: () {
                  if (currentIndex != 2) {
                    setState(() {
                      currentIndex += 1;
                    });
                  } else
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LandingView(),
                        ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

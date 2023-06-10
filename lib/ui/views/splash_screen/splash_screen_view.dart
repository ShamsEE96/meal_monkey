import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/data/repositories/shared_preferences_repository.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/intro_view/intro_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/ui/views/landing_view/landing_view.dart';
import 'package:meal_monkey/ui/views/main_view/main_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 4),
    ).then(
      (value) {
        if (SharedPreferencesRepository.getFirstLaunch() &&
            SharedPreferencesRepository.getTokenInfo() == null) {
          Get.off(IntroView());
        } else
          Get.off(SharedPreferencesRepository.isLoggedIn
              ? MainView()
              : LandingView());

        SharedPreferencesRepository.setFirstLaunch(false);
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SvgPicture.asset(
              'images/bg_background.svg',
              fit: BoxFit.fill,
              width: screenWidth(1),
              height: screenHeight(1),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment(0, 0),
                    colors: [
                      AppColors.mainWhiteColor,
                      AppColors.transparentWhiteColor
                    ],
                    radius: 1.0,
                  ),
                ),
                child: SvgPicture.asset(
                  'images/logo.svg',
                  width: screenWidth(1.5),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                  top: screenHeight(1.5),
                ),
                child: SpinKitThreeBounce(
                  color: AppColors.mainOrangeColor.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

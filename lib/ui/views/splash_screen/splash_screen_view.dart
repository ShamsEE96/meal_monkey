import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/views/landing_view/landing_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 10),
    ).then((value) {
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LandingView();
          },
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
              width: size.width,
              // height: size.height,
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
                  width: size.width * 0.7,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(
                    top: size.height * 0.7,
                  ),
                  child: SpinKitThreeBounce(
                    color: AppColors.mainOrangeColor.withOpacity(0.5),
                  )
                  // CircularProgressIndicator(
                  //   color: AppColors.mainOrangeColor,
                  // ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
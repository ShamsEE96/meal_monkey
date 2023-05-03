import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_navigator_shared.dart';
import 'package:meal_monkey/ui/views/login_view/login_view.dart';
import 'package:meal_monkey/ui/views/signup_view/signup_view.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainWhiteColor,
        body: ListView(
          shrinkWrap: true,
          children: [
            Stack(
              children: [
                CustomPaint(
                  painter: _ClipShadowShadowPainter(
                    clipper: LandingClipper(),
                    shadow: Shadow(
                      blurRadius: 12,
                    ),
                  ),
                  child: ClipPath(
                    clipper: LandingClipper(),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: size.width,
                      height: size.height * 0.6,
                      decoration: BoxDecoration(
                        color: AppColors.mainOrangeColor,
                      ),
                      child: SvgPicture.asset(
                        'images/background_objects.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.28,
                    ),
                    child: SvgPicture.asset(
                      'images/logo.svg',
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.width * 0.08,
              ),
              child: MyCustomText(
                myText:
                    'Discover the best foods from over 1,000 \n restaurants and fast delivery to your doorstep',
                myTextColor: AppColors.secondaryGreyColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1,
              ),
              child: Column(
                children: [
                  CustomButton(
                    myButtonText: 'Login',
                    onPressed: () {
                      context.push(LoginView());
                    },
                  ),
                  (size.width * 0.05).ph,
                  CustomButton(
                    myButtonText: 'Create an Account',
                    myTextColor: AppColors.mainOrangeColor,
                    backgroundColor: AppColors.mainWhiteColor,
                    borderColor: AppColors.mainOrangeColor,
                    onPressed: () {
                      context.push(SignupView());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LandingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width, 0);
    path0.lineTo(0, 0);
    path0.quadraticBezierTo(
        0, size.height * 0.3959520, 0, size.height * 0.5279360);
    path0.cubicTo(
        size.width * -0.0001500,
        size.height * 0.5522720,
        size.width * 0.0034250,
        size.height * 0.5618880,
        size.width * 0.0488000,
        size.height * 0.5594080);
    path0.cubicTo(
        size.width * 0.1109750,
        size.height * 0.5595880,
        size.width * 0.2353250,
        size.height * 0.5599480,
        size.width * 0.2975000,
        size.height * 0.5601280);
    path0.cubicTo(
        size.width * 0.3109000,
        size.height * 0.5596000,
        size.width * 0.3205500,
        size.height * 0.5560960,
        size.width * 0.3206250,
        size.height * 0.5434080);
    path0.cubicTo(
        size.width * 0.3328250,
        size.height * 0.4923360,
        size.width * 0.3389500,
        size.height * 0.4070400,
        size.width * 0.5007000,
        size.height * 0.3988480);
    path0.cubicTo(
        size.width * 0.6604000,
        size.height * 0.4063680,
        size.width * 0.6637500,
        size.height * 0.4946080,
        size.width * 0.6743000,
        size.height * 0.5448320);
    path0.cubicTo(
        size.width * 0.6740750,
        size.height * 0.5578400,
        size.width * 0.6916750,
        size.height * 0.5601440,
        size.width * 0.7000000,
        size.height * 0.5603840);
    path0.cubicTo(
        size.width * 0.7628250,
        size.height * 0.5603160,
        size.width * 0.8830000,
        size.height * 0.5600320,
        size.width * 0.9513000,
        size.height * 0.5601120);
    path0.cubicTo(
        size.width * 0.9866750,
        size.height * 0.5594720,
        size.width * 1.0010000,
        size.height * 0.5583360,
        size.width,
        size.height * 0.5286080);
    path0.quadraticBezierTo(
        size.width * 1.0048000, size.height * 0.3926080, size.width, 0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

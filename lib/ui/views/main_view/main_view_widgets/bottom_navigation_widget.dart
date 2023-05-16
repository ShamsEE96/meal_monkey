import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/core/enums/bottom_navigation.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({
    super.key,
    required this.bottomNavigationEnum,
    required this.onTap,
  });

  final BottomNavigationEnum bottomNavigationEnum;
  final Function(BottomNavigationEnum, int) onTap;

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomPaint(
          painter: _ClipShadowShadowPainter(
            clipper: BottomNavigationClipper(),
            shadow: Shadow(
              offset: Offset(
                0,
                -size.width / 40,
              ),
              blurRadius: 10,
              color: AppColors.mainGreyColor.withOpacity(0.11),
            ),
          ),
          child: ClipPath(
            clipper: BottomNavigationClipper(),
            child: Container(
              width: size.width,
              height: size.height / 8,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: AppColors.mainWhiteColor,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: size.width / 30,
          right: 0,
          left: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.width / 38,
              horizontal: size.width / 23,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                navItem(
                    imageName: 'ic_menu',
                    text: 'Menu',
                    isSelected: widget.bottomNavigationEnum ==
                        BottomNavigationEnum.MENU,
                    onTap: () {
                      widget.onTap(BottomNavigationEnum.MENU, 0);
                    },
                    size: size),
                navItem(
                    imageName: 'ic_shopping',
                    text: 'Offers',
                    isSelected: widget.bottomNavigationEnum ==
                        BottomNavigationEnum.OFFERS,
                    onTap: () {
                      widget.onTap(BottomNavigationEnum.OFFERS, 1);
                    },
                    size: size),
                (size.width / 4).pw,
                navItem(
                    imageName: 'ic_user',
                    text: 'Profile',
                    isSelected: widget.bottomNavigationEnum ==
                        BottomNavigationEnum.PROFILE,
                    onTap: () {
                      widget.onTap(BottomNavigationEnum.PROFILE, 3);
                    },
                    size: size),
                navItem(
                    imageName: 'ic_more',
                    text: 'More',
                    isSelected: widget.bottomNavigationEnum ==
                        BottomNavigationEnum.MORE,
                    onTap: () {
                      widget.onTap(BottomNavigationEnum.MORE, 4);
                    },
                    size: size),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: size.height / 13,
          ),
          child: InkWell(
            onTap: () {
              widget.onTap(BottomNavigationEnum.HOME, 2);
            },
            child: CircleAvatar(
              backgroundColor:
                  widget.bottomNavigationEnum == BottomNavigationEnum.HOME
                      ? AppColors.mainOrangeColor
                      : AppColors.placeholderGreyColor,
              radius: size.width / 11,
              child: SvgPicture.asset(
                'images/ic_home.svg',
                color: AppColors.mainWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget navItem({
    required String imageName,
    required String text,
    required bool isSelected,
    required Function onTap,
    required Size size,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          SvgPicture.asset(
            'images/$imageName.svg',
            color: isSelected
                ? AppColors.mainOrangeColor
                : AppColors.placeholderGreyColor,
            width: size.width / 17,
            height: size.width / 17,
          ),
          (size.width / 35).ph,
          Text(
            text,
            style: TextStyle(
              color: isSelected
                  ? AppColors.mainOrangeColor
                  : AppColors.placeholderGreyColor,
              fontSize: size.width / 30,
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * 0.3381500, 0);
    path0.quadraticBezierTo(size.width * 0.3731500, size.height * 0.0069000,
        size.width * 0.3757000, size.height * 0.1236000);
    path0.quadraticBezierTo(size.width * 0.4022000, size.height * 0.5633000,
        size.width * 0.5006000, size.height * 0.5896000);
    path0.quadraticBezierTo(size.width * 0.5955500, size.height * 0.5727000,
        size.width * 0.6200000, size.height * 0.1240000);
    path0.quadraticBezierTo(size.width * 0.6204500, size.height * -0.0157000,
        size.width * 0.6646000, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, 0);
    path0.lineTo(size.width * 0.6225000, size.height * 0.6100000);
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
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

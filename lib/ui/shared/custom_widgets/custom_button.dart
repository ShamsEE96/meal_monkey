import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/utils.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.text,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    required this.onPressed,
    this.ImageName,
    this.width,
    this.height,
  });

  final String? text;
  final String? ImageName;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;
  final Function? onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) onPressed!();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (ImageName != null) ...[
            SvgPicture.asset('assets/images/$ImageName.svg'),
            (screenWidth(20)).pw,
          ],
          Text(
            text ?? "",
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        side: borderColor != null
            ? BorderSide(
                width: 1.0,
                color: borderColor!,
              )
            : null,
        backgroundColor: backgroundColor ?? AppColors.mainOrangeColor,
        shape: StadiumBorder(),
        fixedSize: Size(
          width ?? screenWidth(1.1),
          height ?? screenHeight(12),
        ),
      ),
    );
  }
}

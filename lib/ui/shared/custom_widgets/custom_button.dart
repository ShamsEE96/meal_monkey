import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.myButtonText,
    this.myTextColor,
    this.backgroundColor,
    this.borderColor,
    required this.onPressed,
    this.myImageName,
  });

  final String myButtonText;
  final String? myImageName;
  final Color? borderColor;
  final Color? myTextColor;
  final Color? backgroundColor;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {
        if (onPressed != null) onPressed!();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (myImageName != null) ...[
            SvgPicture.asset('images/$myImageName.svg'),
            (size.width * 0.03).pw,
          ],
          Text(
            myButtonText,
            style: TextStyle(
              color: myTextColor,
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
          size.width * 0.9,
          size.height * 0.08,
        ),
      ),
    );
  }
}

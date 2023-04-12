import 'package:flutter/material.dart';

class MyCustomText extends StatelessWidget {
  const MyCustomText({
    super.key,
    required this.myText,
    this.myTextColor,
    this.myTextAlign,
    this.fontSize,
  });

  final String myText;
  final Color? myTextColor;
  final TextAlign? myTextAlign;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(
      myText,
      textAlign: myTextAlign ?? TextAlign.center,
      style: TextStyle(
        color: myTextColor,
        fontSize: fontSize ?? size.width * 0.04,
      ),
    );
  }
}




// Big Text size fontSize: size.width * 0.1,
// Small text size fontSize: size.width * 0.04,
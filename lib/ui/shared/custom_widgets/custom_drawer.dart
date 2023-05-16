import 'package:flutter/material.dart';
import 'package:meal_monkey/ui/shared/colors.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
    this.drawerBackgroundColor,
    required this.drawerWidth,
    this.drawerheight,
  });
  final double? drawerWidth;
  final double? drawerheight;
  final Color? drawerBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: drawerheight,
      width: drawerWidth,
      color: drawerBackgroundColor ?? AppColors.mainWhiteColor,
      child: Column(
        children: [
          Text('Options 1'),
          Text('Options 2'),
        ],
      ),
    );
  }
}

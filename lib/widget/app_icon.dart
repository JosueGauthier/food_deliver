import 'package:flutter/material.dart';
import 'package:food_deliver/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData iconData;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const AppIcon({
    Key? key,
    required this.iconData,
    this.backgroundColor = const Color(0xFFf7f6f4),
    this.iconColor = const Color(0xFFa9a29f),
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor),
      child: Icon(
        iconData,
        color: iconColor,
        size: Dimensions.iconsize20,
      ),
    );
  }
}

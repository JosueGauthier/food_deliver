import 'package:flutter/cupertino.dart';
import 'package:food_deliver/utils/colors.dart';

import '../utils/dimensions.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow? overFlow;
  var maxLines;
  bool allowOverFlow;

  SmallText({
    Key? key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 12,
    this.height = 1.2,
    this.overFlow = TextOverflow.ellipsis,
    this.maxLines = null,
    this.allowOverFlow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: allowOverFlow == false ? null : maxLines,
      overflow: allowOverFlow == false ? null : overFlow,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontSize: size,
        height: height,
      ),
    );
  }
}

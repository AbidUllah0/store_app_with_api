import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  Color? color;
  double? fontSize;
  FontWeight? fontWeight;
  double? letterSpacing;
  Color? backgroundColor;
  TextOverflow? overflow;

  CustomText({
    required this.text,
    this.color,
    this.letterSpacing,
    this.overflow,
    this.fontWeight,
    this.fontSize,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        backgroundColor: backgroundColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        overflow: overflow,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

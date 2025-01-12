
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_finder/core/styles/my_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final bool? alignCenter;
  final bool? isEllipsis;
  final double? wordSpace;
  final double? letterSpace;
  final int? maxLine;
  final TextDirection? textDirection;
  const CustomText({
    super.key,
    required this.text,
    this.color,
    required this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.textDecoration,
    this.alignCenter,
    this.isEllipsis = false,
    this.wordSpace = 0,
    this.letterSpace = 0,
    this.maxLine ,
    this.textDirection ,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.w),
      child: Text(
        text,
        style: TextStyle(
          decoration: textDecoration ?? TextDecoration.none,
          color: color ?? kBlack,
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.normal,
          letterSpacing: letterSpace,
          wordSpacing: wordSpace,
        ),
        overflow: isEllipsis==true?TextOverflow.ellipsis:null,
        textAlign: alignCenter == true ? TextAlign.center : null,
        maxLines: maxLine??1,
      ),
    );
  }
}

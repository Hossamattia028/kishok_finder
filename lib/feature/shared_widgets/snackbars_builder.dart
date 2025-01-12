import 'package:kiosk_finder/core/styles/app_style.dart';
import 'package:kiosk_finder/core/styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnackBarBuilder {
  static showFeedBackMessage(BuildContext context, String message, Color color,
      {bool addBehaviour = true,bool isMarginBottom = false,int duration = 1000 }) {

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,style: TextStyle(fontSize: AppStyle.small.sp-1,),),
        backgroundColor: color,
        margin: isMarginBottom?EdgeInsets.only(bottom: 132.h):EdgeInsets.zero,
        padding: EdgeInsets.all(4.w),
        behavior: addBehaviour ? SnackBarBehavior.floating : null,
        duration: Duration(milliseconds: duration),
        action: SnackBarAction(
            label: "",
            textColor: kWhite,
            onPressed: () => ScaffoldMessenger.of(context).clearSnackBars),
      ),
    );
  }
}
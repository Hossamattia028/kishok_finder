import 'package:flutter/material.dart';
import 'package:kiosk_finder/core/strings/app_images.dart';


class LoadingShimmer extends StatelessWidget {
  final double height;
  final double width;
  const LoadingShimmer({super.key,required this.height,required this.width});

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(AppImages.icons,height: height, width: width,fit: BoxFit.fill,),);
  }
}

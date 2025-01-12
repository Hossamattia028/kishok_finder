
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_finder/core/styles/app_style.dart';
import 'package:kiosk_finder/core/styles/my_colors.dart';
import 'package:kiosk_finder/core/utils/small_fun.dart';
import 'package:kiosk_finder/feature/authentication/presentation/screens/login.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: "Already have an account",
          children: [
            TextSpan(
              text: ' login',
              style: TextStyle(
                color: kPrimary,
                fontWeight: FontWeight.w500,
                fontSize: AppStyle.average.sp,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Util.pushPage(const LoginScreen(), context),
            )
          ],
          style: TextStyle(
            color: kBlack2,
            fontSize: AppStyle.small.sp,
          ),
        ),
      ),
    );
  }
}

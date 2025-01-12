
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_finder/core/styles/app_style.dart';
import 'package:kiosk_finder/core/styles/my_colors.dart';
import 'package:kiosk_finder/core/utils/small_fun.dart';
import 'package:kiosk_finder/feature/authentication/presentation/screens/register.dart';

class NotHaveAnAccountWidget extends StatelessWidget {
  const NotHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text:
        "not have an account  ",
        children: [
          TextSpan(
            text: "register new account",
            style: TextStyle(
              color: kPrimary,
              fontWeight: FontWeight.w500,
              fontSize: AppStyle.average.sp,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Util.pushPage(const RegisterScreen(), context),
          )
        ],
        style: TextStyle(
          color: kBlack2,
          fontSize: AppStyle.small.sp
        ),
      ),
    );
  }
}

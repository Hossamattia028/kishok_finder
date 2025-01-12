
import 'package:flutter/material.dart';
import 'package:kiosk_finder/core/styles/my_colors.dart';
import 'package:kiosk_finder/core/utils/small_fun.dart';
import 'package:kiosk_finder/feature/home/presentation/screens/home_screen.dart';
import 'package:kiosk_finder/feature/shared_widgets/custom_text.dart';
class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: "no connection",
                color: kText2,
                fontSize: 20,
              ),
              IconButton(onPressed: ()=> Util.pushPageAndRemoveRoutes(const HomeScreen(), context), icon:  const Icon(Icons.refresh,color: kRed,)),
            ],
          )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/shared/utils.dart';
import 'package:car_service/ui/views/splash_screen_view/splash_screen_controller.dart';

// ignore: must_be_immutable
class SplashScreenView extends StatelessWidget {
  SplashScreenView({Key? key}) : super(key: key);

  SplashScreenController? controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          children: [
            (100.h).ph,
            SvgPicture.asset(
              'assets/images/car_spalsh.svg',
              width: screenWidth(3),
              height: screenHeight(3),
            ),
            const Spacer(),
            SpinKitRing(color: AppColors.mainColor),
            (50.h).ph,
            Center(
              child: SvgPicture.asset(
                'assets/images/flag.svg',
                width: screenWidth(6),
                height: screenHeight(6),
              ),
            ),
            (40.h).ph,
          ],
        ));
  }
}

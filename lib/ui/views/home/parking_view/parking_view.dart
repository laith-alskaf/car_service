import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ParkingView extends StatelessWidget {
  ParkingView({super.key});

  // HomeViewController controller = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      CustomAppBar(
        title: 'Parking',
        iconSetting: true,
      ),
      (10.h).ph,
    ]);
  }
}

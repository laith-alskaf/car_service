import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';

import '../../../../shared/colors.dart';
import '../../parking_view/park_spot/park_spot_view_controller.dart';
import '../home_view_controller.dart';

class ServicesContainer extends StatelessWidget {
   ServicesContainer({super.key});
   HomeViewController controller = Get.put(HomeViewController());


   @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeViewController>(
        builder: (c) {
      return
      Container(
      width: 1.sw,
      height: 0.2.sh,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color:  AppColors.mainColor.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
        // borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),      child: Padding(
        padding:  EdgeInsets.all( defaultPadding),
        child: Column(
          children: [
            Row(
              children: [
                CustomText(text: "Going On Services", textType: TextStyleType.bodyBig,
                textColor: AppColors.blueColor,)
              ],
            ),
            (15.h).ph,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Parking Timer", textType:TextStyleType.body ),
                (30.w).pw,
                IconButton(
                  onPressed: () {
                    // Show the dialog when the button is pressed
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // Return a dialog widget
                        return AlertDialog(
                          title: Text('Add Item'), // Dialog title
                          content: Text('Are you sure you want to add this item?'), // Dialog content
                          actions: <Widget>[
                            // Cancel button
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Dismiss the dialog
                              },
                              child: Text('Cancel'),
                            ),
                            // OK button
                            TextButton(
                              onPressed: () {
                                controller.expandtime();
                                Navigator.of(context).pop(); // Dismiss the dialog
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.add),
                ),
                (20.w).pw,
                TimerCountdown(
                  timeTextStyle: TextStyle(color: AppColors.blackColor,
                  fontWeight: FontWeight.bold),
                  format: CountDownTimerFormat.hoursMinutesSeconds,
                  endTime: DateTime.now().add(
                    Duration(
                      hours:  controller.parkingtimer.value.hours??0,
                      minutes: controller.parkingtimer.value.minutes??0,
                      seconds: controller.parkingtimer.value.seconds??0,
                    ),
                  ),
                  onEnd: () {
                    print("Timer finished");
                  },
                )
              ],
            ),
            (15.h).ph,
            Row(

              children: [
                CustomText(text: "Maintenance ", textType: TextStyleType.body,
                  ),
                (40.w).pw,
                CustomText(text: "none ", textType: TextStyleType.body,)



                  ],
            ),




          ],

            ),
      ),
    );});
  }
}

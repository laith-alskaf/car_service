import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import '../../../../shared/colors.dart';
import '../home_view_controller.dart';

class ServicesContainer extends StatelessWidget {
  const ServicesContainer({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeViewController>(builder: (controller) {
      return Container(
        width: 1.sw,
        height: 0.18.sh,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.mainColor.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  CustomText(
                    text: "Going On Services",
                    textType: TextStyleType.bodyBig,
                    textColor: AppColors.blueColor,
                  )
                ],
              ),
              (15.h).ph,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Parking Timer",
                    textType: TextStyleType.body,
                    fontSize: 16.h,
                  ),
                  Center(
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: const Text(
                                  'Are you sure you want to expand your parking time'),
                              actions: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.changePrice(dec: false);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.mainColor,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                        ),
                                        width: 40.w,
                                        height: 40.w,
                                        child: const CustomText(
                                          isTextAlign: TextAlign.center,
                                          textType: TextStyleType.bodyBig,
                                          text: '-',
                                        ),
                                      ),
                                    ),
                                    Obx(() => Container(
                                          alignment: Alignment.center,
                                          width: 40.w,
                                          height: 40.w,
                                          child: CustomText(
                                            isTextAlign: TextAlign.center,
                                            textType: TextStyleType.bodyBig,
                                            text: controller
                                                .numberHoursPark.value
                                                .toString(),
                                          ),
                                        )),
                                    InkWell(
                                      onTap: () {
                                        controller.changePrice(dec: true);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.mainColor,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                        ),
                                        width: 40.w,
                                        height: 40.w,
                                        child: const CustomText(
                                          isTextAlign: TextAlign.center,
                                          textType: TextStyleType.bodyBig,
                                          text: '+',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                (20.h).ph,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        controller.expandTime();

                                        Get.back();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.add, color: AppColors.mainColor),
                    ),
                  ),
                  TimerCountdown(
                    timeTextStyle: const TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold),
                    format: CountDownTimerFormat.hoursMinutesSeconds,
                    endTime: DateTime.now().add(
                      Duration(
                        hours: controller.parkingTimer!.hours ?? 0,
                        minutes: controller.parkingTimer!.minutes ?? 0,
                        seconds: controller.parkingTimer!.seconds ?? 0,
                      ),
                    ),
                    onEnd: () {
                      print("Timer finished");
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

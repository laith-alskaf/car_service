import 'package:car_service/core/enums/message_type.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/custom_widget/custom_toast.dart';
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
      return IntrinsicHeight(
        child: Container(
          width: 1.sw,
          // height: 0.18.sh,
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
                if (controller.parkingTimer!.hours != 00 &&
                    controller.parkingTimer!.minutes != 00) ...[
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
                            if (controller.parkingTimer!.hours != 00 &&
                                controller.parkingTimer!.minutes != 00) {
                              controller.showDialogExpandTime();
                            } else {
                              CustomToast.showMessage(
                                  message: 'Yoy have\'t choose any park yet',
                                  messageType: MessageType.WARNING);
                            }
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
                ] else ...[
                  CustomText(
                    text: "No Parking exist",
                    textType: TextStyleType.body,
                    fontSize: 16.h,
                  ),
                ]
              ],
            ),
          ),
        ),
      );
    });
  }
}

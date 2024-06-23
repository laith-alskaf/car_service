import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/parking_view/custom_order_detiels_contiener.dart';
import 'package:car_service/ui/views/home/parking_view/park_spot/park_spot_view_controller.dart';
import 'package:car_service/ui/views/main_view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../shared/colors.dart';

// ignore: must_be_immutable
class ParkingOrderDetiels extends StatelessWidget {
  ParkingOrderDetiels({super.key});

  ParkSpotViewController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: GetBuilder<ParkSpotViewController>(
            builder: (c) {
              return Column(
                children: [
                  const CustomAppBar(title: "order detiels"),
                  (10.h).ph,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 180.0,
                          animation: true,
                          animationDuration: 5000,
                          backgroundWidth: 20,
                          lineWidth: 20.0,
                          percent: 1,
                          center: TimerCountdown(
                            timeTextStyle: const TextStyle(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                            format: CountDownTimerFormat.hoursMinutesSeconds,
                            endTime: DateTime.now().add(
                              Duration(
                                  hours: controller.parkingtimer.hours! ,
                                  minutes:controller.parkingtimer.minutes!,
                                  seconds:controller.parkingtimer.seconds!
                              ),
                            ),
                            onEnd: () {
                              print("Timer finished");
                            },
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          backgroundColor: AppColors.grayColor.withOpacity(0.2),
                          progressColor: AppColors.mainColor,
                        ),
                        (10.h).ph,
                        CustomOrderDetielsContiener(
                          parkNumber:
                              controller.parkorderDetails.parkNumber.toString(),
                          carNumber:
                              controller.parkorderDetails.carNumber ?? "",
                          bookingEndTime:
                              controller.parkorderDetails.bookingEndTime ?? "",
                          parksNum:
                              controller.parkorderDetails.parksNum.toString(),
                          parkingName:
                              controller.parkorderDetails.parkingName ?? "",
                          duration:
                              controller.parkorderDetails.duration.toString(),
                          price: controller.parkorderDetails.price.toString(),
                        ),
                        (10.h).ph,
                        CustomButton(
                          text: "go to home page",
                          buttonTypeEnum: ButtonTypeEnum.big,
                          width: 1.sw,
                          onPressed: () {
                            Get.to(MainView());
                          },
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          )),
    );
  }
}

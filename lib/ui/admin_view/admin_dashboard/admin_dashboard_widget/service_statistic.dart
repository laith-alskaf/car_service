import 'package:car_service/ui/admin_view/admin_dashboard/admin_dashboard_controller.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ProjectStatisticDashBoard extends StatelessWidget {
  ProjectStatisticDashBoard({super.key, required this.actionIndex});

  final int actionIndex;
  AdminDashboardController adminDashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.h,
          width: 200.w,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border(
                  top: BorderSide(color: AppColors.blackColor,width: 0.3),
                  left: BorderSide(color: AppColors.blackColor,width: 0.3),
                  right: BorderSide(color: AppColors.blackColor,width: 0.3)),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              )),
          alignment: Alignment.center,
          child: CustomText(
            textType: TextStyleType.bodyBig,
            text: 'sdsds',
          ),
        ),
        Container(
            width: 1.sw,
            height: 410.h,
            padding: EdgeInsetsDirectional.only(
                bottom: 25.h, start: 10.w, top: 25.h),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: AppColors.blackColor,width: 0.3),
                    left: BorderSide(color: AppColors.blackColor,width: 0.3),
                    right: BorderSide(color: AppColors.blackColor,width: 0.3),
                    top: BorderSide(color: AppColors.blackColor,width: 0.3)),
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(15.r)),
            child: adminDashboardController.countAllParkModel.isEmpty
                ? SpinKitSpinningCircle(
                    color: AppColors.blueColor,
                  )
                : BarChart(
                    BarChartData(
                        maxY: adminDashboardController
                                .countAllParkModel[0].total!
                                .toDouble() +
                            5,
                        barTouchData: BarTouchData(enabled: true),
                        titlesData: FlTitlesData(
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              axisNameWidget: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.h),
                                child: Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Wrap(
                                      children: List.generate(
                                          adminDashboardController
                                              .countAllParkModel
                                              .length, (index) {
                                    return Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            end: 10.w, bottom: 10.h),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomText(
                                                textType: TextStyleType.body,
                                                text: adminDashboardController
                                                    .countAllParkModel[index]
                                                    .parkName!),
                                            (5.w).pw,
                                            Container(
                                              width: 15.w,
                                              height: 15.w,
                                              decoration: BoxDecoration(
                                                  color:
                                                      adminDashboardController
                                                          .colorsBar[index],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.r)),
                                            ),
                                          ],
                                        ));
                                  })),
                                ),
                              ),
                              sideTitles: SideTitles(
                                showTitles: false,
                              ),
                            )),
                        borderData: FlBorderData(
                          border: Border(
                              bottom: BorderSide(color: AppColors.blackColor),
                              right: BorderSide(color: AppColors.blackColor)),
                        ),
                        barGroups: List.generate(
                            adminDashboardController.countAllParkModel.length,
                            (index) {
                          return BarChartGroupData(x: index, barRods: [
                            BarChartRodData(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.r),
                                    topRight: Radius.circular(5.r)),
                                width: 0.05.sw,
                                toY: adminDashboardController
                                    .countAllParkModel[index].total!
                                    .toDouble(),
                                color:
                                    adminDashboardController.colorsBar[index]),
                          ]);
                        })),
                    swapAnimationDuration:
                        const Duration(milliseconds: 150), // Optional
                    swapAnimationCurve: Curves.linear, // Optional
                  )),
      ],
    );
  }
}
// BarChartGroupData(x: 0, barRods: [
// BarChartRodData(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(10.r),
// topRight: Radius.circular(10.r)),
// width: 0.04.sw,
// toY: adminDashboardController.todoCounter.value
//     .toDouble(),
// color: AppColors.blueColor),
// ]),
// BarChartGroupData(x: 1, barRods: [
// BarChartRodData(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(10.r),
// topRight: Radius.circular(10.r)),
// width: 0.04.sw,
// toY: adminDashboardController.processingCounter.value
//     .toDouble(),
// color: AppColors.redColorSyriatel),
// ]),
// BarChartGroupData(x: 2, barRods: [
// BarChartRodData(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(10.r),
// topRight: Radius.circular(10.r)),
// width: 0.04.sw,
// toY: adminDashboardController.finishedCounter.value
//     .toDouble(),
// color: AppColors.mtnYellowColor),
// ]),

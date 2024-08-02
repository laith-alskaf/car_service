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
  const ProjectStatisticDashBoard(
      {super.key, required this.adminDashboardController});

  final AdminDashboardController adminDashboardController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.75.sw,
      height: 410.h,
      padding: EdgeInsetsDirectional.only(bottom: 10.h, start: 10.w),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8.r)),
      child: Obx(() {
        return adminDashboardController.projectsList.isEmpty
            ? SpinKitSpinningCircle(
                color: AppColors.blueColor,
              )
            : BarChart(
                BarChartData(
                  maxY: adminDashboardController.projectsList.length.toDouble(),
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                      topTitles: AxisTitles(
                        axisNameSize: 30,
                        axisNameWidget: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: Row(children: [
                            const CustomText(
                                textType: TextStyleType.bodyBig,
                                text: 'Project: '),
                            (20.w).pw,
                            const CustomText(
                                textType: TextStyleType.body, text: 'Todo'),
                            (5.w).pw,
                            Container(
                              width: 0.02.sw,
                              height: 0.04.sh,
                              decoration: BoxDecoration(
                                  color: AppColors.blueColor,
                                  borderRadius: BorderRadius.circular(2.r)),
                            ),
                            (20.w).pw,
                            const CustomText(
                                textType: TextStyleType.body,
                                text: 'Processing'),
                            (5.w).pw,
                            Container(
                              width: 0.02.sw,
                              height: 0.04.sh,
                              decoration: BoxDecoration(
                                  color: AppColors.redColorSyriatel,
                                  borderRadius: BorderRadius.circular(2.r)),
                            ),
                            (20.w).pw,
                            const CustomText(
                                textType: TextStyleType.body, text: 'Finished'),
                            (5.w).pw,
                            Container(
                              width: 0.02.sw,
                              height: 0.04.sh,
                              decoration: BoxDecoration(
                                  color: AppColors.mtnYellowColor,
                                  borderRadius: BorderRadius.circular(2.r)),
                            ),
                          ]),
                        ),
                        sideTitles: const SideTitles(showTitles: false),
                      ),
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      )),
                  borderData: FlBorderData(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r)),
                          width: 0.04.sw,
                          toY: adminDashboardController.todoCounter.value
                              .toDouble(),
                          color: AppColors.blueColor),
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r)),
                          width: 0.04.sw,
                          toY: adminDashboardController.processingCounter.value
                              .toDouble(),
                          color: AppColors.redColorSyriatel),
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r)),
                          width: 0.04.sw,
                          toY: adminDashboardController.finishedCounter.value
                              .toDouble(),
                          color: AppColors.mtnYellowColor),
                    ]),
                  ],
                ),
                swapAnimationDuration:
                    const Duration(milliseconds: 150), // Optional
                swapAnimationCurve: Curves.linear, // Optional
              );
      }),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/views/home/history_view/history_widget/title_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'all_order_controller.dart';
import 'custom_all_orders.dart';

class AllOrderView extends StatelessWidget {
  const AllOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    AllOrderController controller = Get.put(AllOrderController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: ListView(children: [
          const CustomAppBar(
            title: 'All Orders',
            iconSetting: true,
          ),
          Padding(
              padding: EdgeInsets.only(
                  right: 30.w, left: 30.w, bottom: 10.h, top: 20.h),
              child: GetBuilder<AllOrderController>(builder: (s) {
                return Container(
                  width: 516.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    border: Border.all(color: AppColors.whiteColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.r),
                    ),
                    color: AppColors.whiteColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ServiceTitle(
                        onTap: () {
                          controller.handleClickFilter(serviceIndex: 0);
                        },
                        onClick: controller.index == 0 ? true : false,
                        selectedContainer: (controller.index == 0)
                            ? AppColors.mainColor
                            : Colors.transparent,
                        title: 'Parking',
                        titleContainer: (controller.index == 0)
                            ? AppColors.whiteColor
                            : AppColors.colorBorder,
                      ),
                      ServiceTitle(
                        onTap: () {
                          controller.handleClickFilter(serviceIndex: 1);
                        },
                        onClick: controller.index == 1 ? true : false,
                        selectedContainer: (controller.index == 1)
                            ? AppColors.mainColor
                            : Colors.transparent,
                        title: 'Repairs',
                        titleContainer: (controller.index == 1)
                            ? AppColors.whiteColor
                            : AppColors.colorBorder,
                      ),
                    ],
                  ),
                );
              })),
          ZoomIn(
            child: SizedBox(
              height: 0.8.sh,
              child: Padding(
                  padding: EdgeInsets.only(top: 10.h, bottom: 290.h),
                  child: GetBuilder<AllOrderController>(
                    builder: (c) {
                      return controller.index == 0
                          ? (controller.parkingHistory == null
                              ? Center(
                                  child: SpinKitCircle(
                                    color: AppColors.mainColor,
                                    size: 100.w,
                                  ),
                                )
                              : controller.parkingHistory!.isEmpty
                                  ? const Center(
                                      child: CustomText(
                                          text: 'No Data',
                                          textType: TextStyleType.title),
                                    )
                                  : CustomAllOrders(
                                      onTap: () {},
                                    ))
                          : controller.problemHistory == null
                              ? Center(
                                  child: SpinKitCircle(
                                    color: AppColors.mainColor,
                                    size: 100.w,
                                  ),
                                )
                              : controller.problemHistory!.isEmpty
                                  ? const Center(
                                      child: CustomText(
                                          text: 'No Data',
                                          textType: TextStyleType.title),
                                    )
                                  : CustomAllOrders(
                                      onTap: () {},
                                    );
                    },
                  )),
            ),
          )
        ]),
      ),
    );
  }
}

import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/billing_view/billing_widget/custom_container_payment.dart';
import 'package:car_service/ui/views/home/repair_view/choose_place_view/choose_place_view.dart';
import 'package:car_service/ui/views/home/repair_view/choose_problem_type_view/choose_problem_type_view.dart';
import 'package:car_service/ui/views/home/repair_view/choose_problem_view/choose_problem_view.dart';
import 'package:car_service/ui/views/home/repair_view/main_reapair_controller.dart';
import 'package:car_service/ui/views/home/repair_view/oreder_details_view/order_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MainRepairView extends StatelessWidget {
  MainRepairView({super.key});

  MainRepairController controller = Get.put(MainRepairController());

  @override
  Widget build(BuildContext context) {
    return ListView(physics: const NeverScrollableScrollPhysics(), children: [
      const CustomAppBar(
        title: '',
        iconSetting: true,
      ),
      (10.h).ph,
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GetBuilder<MainRepairController>(
            builder: (s) {
              return SizedBox(
                height: 0.8.sh,
                child: Column(
                  children: [
                    FlutterStepIndicator(
                      height: 60.w,
                      paddingLine: const EdgeInsets.symmetric(horizontal: 0),
                      positiveColor: AppColors.mainColor,
                      progressColor: const Color(0xFFEA9C00),
                      negativeColor: const Color(0xFFD5D5D5),
                      padding: EdgeInsets.all(4.w),
                      list: controller.list,
                      division: controller.counter,
                      onChange: (i) {},
                      page: controller.page,
                      onClickItem: (p0) {
                        controller.page = p0;
                        controller.update();
                      },
                    ),
                    (20.h).ph,
                    if (controller.page == 0) const ChooseProblemTypeView(),
                    if (controller.page == 1) const ChooseProblemView(),
                    if (controller.page == 2) RepairChoosePlaceView(),
                    if (controller.page == 3) const OrderDetailsView(),
                    if (controller.page == 4)
                      Column(
                        children: [
                          Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 40.h,
                                ),
                                child: CustomContainerPayment(
                                  indexes: 1,
                                ),
                              )),
                          Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 40.h,
                                ),
                                child: CustomContainerPayment(
                                  indexes: 2,
                                ),
                              )),
                        ],
                      ),
                    const Spacer(),
                    Column(
                      children: [
                        CustomButton(
                          onPressed: () {
                            controller.handleClickStep(isIncrease: true);
                          },
                          text: controller.page == 4 ? 'Finish' : 'Next',
                          buttonTypeEnum: ButtonTypeEnum.big,
                          height: 55.h,
                        ),
                        (20.h).ph,
                        GestureDetector(
                            onTap: () {
                              controller.handleClickStep(isIncrease: false);
                            },
                            child: CustomText(
                              text: 'Back',
                              textType: TextStyleType.bodyBig,
                              textColor: AppColors.mainColor,
                            )),
                      ],
                    ),
                    (20.h).ph,
                  ],
                ),
              );
            },
          )),
    ]);
  }
}
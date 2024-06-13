import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/oreder_details_view/order_details_view.dart';
import 'package:car_service/ui/views/home/repair_view/repair_workshop_view/repair_workshop_controller.dart';
import 'package:car_service/ui/views/home/repair_view/repair_workshop_view/workshop_widget/app_bar_workshop.dart';
import 'package:car_service/ui/views/home/repair_view/repair_workshop_view/workshop_widget/coursor_widget.dart';
import 'package:car_service/ui/views/home/repair_view/repair_workshop_view/workshop_widget/custom_container_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RepairWorkshopView extends StatelessWidget {
  RepairWorkshopView({super.key});

  RepairWorkshopController controller = Get.put(RepairWorkshopController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            ListView(physics: const NeverScrollableScrollPhysics(), children: [
          const CustomAppBar(
            title: 'Repair Workshop',
            existBack: true,
          ),
          (30.h).ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCourserWidget(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.w,
                    right: 20.w,
                    left: 20.w,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 300.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                                text: 'Location,192/2,Laith',
                                textType: TextStyleType.bodyBig),
                            Row(
                              children: [
                                CustomText(
                                  text: 'Colse ',
                                  textType: TextStyleType.bodyBig,
                                  textColor: AppColors.mainColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                const CustomText(
                                    text: 'sdjjs s',
                                    textType: TextStyleType.bodyBig),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                          padding: EdgeInsets.all(12.w),
                          height: 50.w,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: AppColors.grayColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(100.r)),
                          child:
                              SvgPicture.asset('assets/images/location.svg')),
                    ],
                  ),
                ),
                tabBarWorkshop(repairWorkshopController: controller),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => OrderDetailsView(

                  ));
            },
            child: Container(
              color: AppColors.backgroundColor,
              width: 1.sw,
              height: 0.5.sh,
              child: ListView(
                primary: true,
                shrinkWrap: true,
                children: List.generate(
                    controller.itemService.length,
                    (index) => CustomContainerService(
                        service: controller.itemService[index],
                        controller: controller,
                        index: index)),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

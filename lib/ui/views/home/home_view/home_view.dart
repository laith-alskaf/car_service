import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/home_view/home_view_controller.dart';
import 'package:car_service/ui/views/home/home_view/home_widget/conteiner_info.dart';
import 'package:car_service/ui/views/home/home_view/home_widget/services_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'home_widget/container_subscription.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});

  HomeViewController controller = Get.put(HomeViewController());


  @override
  Widget build(BuildContext context) {
   return GetBuilder<HomeViewController>(// Replace YourControllerClass with the actual controller you're using
     builder: (controller) {
        return ListView(
          children: [
            const CustomAppBar(
              title: 'Home',
              iconSetting: true,
            ),
            (50.h).ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContainerSubscription(),
                  (50.h).ph,
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 5.h),
                    child: Row(
                      children: [
                        CustomText(
                          text: "And Many More! go and see our premuim Packages",
                          textType: TextStyleType.bodyBig,
                          textColor: AppColors.blueColor,
                          fontSize: 16.h,
                        ),
                        (10.w).pw,
                        Icon(Icons.arrow_forward_outlined, color: AppColors.blueColor,),
                      ],
                    ),
                  ),
                  (20.h).ph,
                  Center(
                    child: CustomContainerInfo(title: "Find Available Maintenance spots",
                      image: "meantenance",
                    ),
                  ),
                  (20.h).ph,
                  Row(
                    children: [
                      CustomContainerInfo(title: "Scan Qr Code",
                        image: "qr",
                        width: 0.4.sw,
                      ),
                      (15.w).pw,
                      CustomContainerInfo(title: "Find Your Parking Spot",
                        image: "spot",
                        width: 0.57.sw,
                      ),
                    ],
                  ),
                  (20.h).ph,

                ],
              ),
            ),
            Obx(() {
              return controller.parkingtimer.value == null ? SpinKitCircle(color: AppColors.mainColor,) :
                  ServicesContainer();


            }),
          ],
        );
      },
    );
  }
}

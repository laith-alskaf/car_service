import 'package:car_service/core/translation/app_translation.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/home_view/home_view_controller.dart';
import 'package:car_service/ui/views/home/home_view/home_widget/conteiner_info.dart';
import 'package:car_service/ui/views/home/home_view/home_widget/custom_container_qution.dart';
import 'package:car_service/ui/views/home/home_view/home_widget/qr_scanner.dart';
import 'package:car_service/ui/views/home/home_view/home_widget/services_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../admin_view/add_park/add_park_view.dart';
import 'home_widget/container_subscription.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      init: HomeViewController(),
      builder: (controller) {
        return RefreshIndicator(
          onRefresh: () async {
            return controller.onInit();
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              CustomAppBar(
                title: tr('Home'),
                iconSetting: true,
              ),
              (20.h).ph,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomContainerQution(
                      indexes: 0,
                    ),
                    (20.h).ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomContainerInfo(
                          title: tr("Book your service"),
                          onpresed: () {
                            //@TODO
                            // Get.to(() => AddParkView());
                          },
                          image: "meantenance",
                        ),
                        (30.w).pw,
                        CustomContainerInfo(
                          title: tr("Find Your Parking Spot"),
                          image: "spot",
                        ),
                      ],
                    ),
                    (20.h).ph,
                    Center(
                      child: Container(
                          width: 390.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)),
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              (20.w).pw,
                              SvgPicture.asset(
                                "assets/images/qr.svg",
                                height: 50.h,
                              ),
                              (50.w).pw,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: tr('Already in the parking ?'),
                                    textType: TextStyleType.body,
                                    textColor: AppColors.blackColor,
                                    isTextAlign: TextAlign.center,
                                  ),
                                  (10.h).ph,
                                  CustomButton(
                                    text: tr('Scan Now'),
                                    buttonTypeEnum: ButtonTypeEnum.small,
                                    width: 100.w,
                                    fontSize: 18.sp,
                                    onPressed: () {
                                      showQrScanner();
                                    },
                                  )
                                ],
                              ),
                            ],
                          )),
                    ),
                    (20.h).ph,
                  ],
                ),
              ),
              ServicesContainer()
            ],
          ),
        );
      },
    );
  }
}

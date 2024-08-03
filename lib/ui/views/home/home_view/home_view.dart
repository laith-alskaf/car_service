import 'package:car_service/ui/admin_view/all_order_detiels/all_order_view.dart';
import 'package:car_service/ui/admin_view/all_parking_order/all_parking_order_view.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/home_view/home_view_controller.dart';
import 'package:car_service/ui/views/home/home_view/home_widget/conteiner_info.dart';
import 'package:car_service/ui/views/home/home_view/home_widget/qr_scanner.dart';
import 'package:car_service/ui/views/home/home_view/home_widget/services_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
              const CustomAppBar(
                title: 'Home',
                iconSetting: true,
              ),
              (50.h).ph,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return AlertDialog(
                          //       backgroundColor: AppColors.whiteColor,
                          //       content: const Text(
                          //           'Are you sure you want to be a prime member of this app ?'),
                          //       actions: <Widget>[
                          //         Row(
                          //           crossAxisAlignment: CrossAxisAlignment.center,
                          //            mainAxisAlignment: MainAxisAlignment.center ,
                          //           children: [
                          //             InkWell(
                          //               onTap: () {
                          //                 Navigator.of(context).pop();
                          //               },
                          //               child:  CustomText(
                          //                 textType: TextStyleType.subtitle,
                          //                 text: "cansel",
                          //                 textColor: AppColors.mainColor,
                          //               ),
                          //             ),
                          //             (60.w).pw,
                          //             CustomButton(
                          //               buttonTypeEnum: ButtonTypeEnum.small,
                          //               onPressed: () {
                          //                 controller.GetProSub();
                          //                 Navigator.of(context).pop();
                          //               },
                          //               text: "ok",
                          //               backgroundColor: AppColors.mainColor,
                          //             )
                          //           ],
                          //         ),
                          //       ],
                          //     );
                          //   },
                          // );

                        },
                        child: ContainerSubscription()),
                    (50.h).ph,
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 5.h),
                      child: Row(
                        children: [
                          CustomText(
                            text:
                                "And Many More! go and see our premuim Packages",
                            textType: TextStyleType.bodyBig,
                            textColor: AppColors.blueColor,
                            fontSize: 16.h,
                          ),
                          (10.w).pw,
                          Icon(
                            Icons.arrow_forward_outlined,
                            color: AppColors.blueColor,
                          ),
                        ],
                      ),
                    ),
                    (20.h).ph,
                    Center(
                      child: CustomContainerInfo(
                        title: "Find Available Maintenance spots",
                        onpresed: () {
                          Get.to(() =>  AddParkView());
                        },
                        image: "meantenance",
                      ),
                    ),
                    (20.h).ph,
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showQrScanner();
                          },
                          child: CustomContainerInfo(
                            title: "Scan Qr Code",
                            image: "qr",
                            width: 0.4.sw,
                          ),
                        ),
                        (15.w).pw,
                        CustomContainerInfo(
                          title: "Find Your Parking Spot",
                          image: "spot",
                          width: 0.57.sw,
                        ),
                      ],
                    ),
                    (20.h).ph,
                  ],
                ),
              ),
              controller.parkingTimer == null
                  ? SpinKitCircle(
                      color: AppColors.mainColor,
                    )
                  :  ServicesContainer()
            ],
          ),
        );
      },
    );
  }
}

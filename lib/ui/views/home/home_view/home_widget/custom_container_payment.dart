import 'package:animate_do/animate_do.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/home_view/home_view_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomContainerPayment extends StatelessWidget {
  CustomContainerPayment({super.key, required this.indexes});

  final HomeViewController controller = Get.put(HomeViewController());
  final int indexes;

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: CarouselSlider.builder(
        carouselController: controller.buttonCarouselController,
        itemBuilder: (context, index, realIndex) {
          return GestureDetector(
            onTap: () {
              controller.handleClickCar(title: controller.cash[indexes][index]);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                padding: EdgeInsetsDirectional.only(top: 15.h, end: 40.w),
                width: 350.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.r)),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF414495),
                      Color(0xFF2E306A),
                      Color(0xFF474BA4),
                      Color(0xFF2E306A),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ListView(children: [
                  CustomText(
                    startPadding: 15.w,
                    text: 'daks jdlkas dklasj djlaskj',
                    textType: TextStyleType.title,
                    textColor: AppColors.whiteColor,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/images/bmwi8.jpg'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25.r),
                          ),
                        ),
                        height: 200.w,
                        width: 250.w,
                        // Image.asset(
                        //   'assets/images/${controller.cash[indexes][index]}.png',
                        //   width: 134.w,
                        // ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (40.h).ph,
                          CustomText(
                            text: 'asd askdjsad jkas',
                            textType: TextStyleType.bodyBig,
                            textColor: AppColors.whiteColor,
                          ),
                          (40.h).ph,
                          CustomText(
                            text: '123,2323',
                            textType: TextStyleType.title,
                            textColor: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),

                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          );
        },
        itemCount: controller.cash[indexes].length,
        options: CarouselOptions(
          initialPage: 0,
          height: 210.h,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          viewportFraction: 1,
          scrollPhysics:
              indexes == 0 ? const NeverScrollableScrollPhysics() : null,
          onPageChanged: indexes == 1
              ? controller.onPageChanged1
              : controller.onPageChanged2,
        ),
      ),
    );
  }
}

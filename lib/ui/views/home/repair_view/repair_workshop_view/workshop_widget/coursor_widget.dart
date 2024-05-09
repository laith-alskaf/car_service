import 'package:animate_do/animate_do.dart';
import 'package:car_service/ui/views/home/repair_view/repair_workshop_view/repair_workshop_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomCourserWidget extends StatelessWidget {
  CustomCourserWidget({super.key});

  RepairWorkshopController controller = Get.put(RepairWorkshopController());

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: CarouselSlider.builder(
        carouselController: controller.buttonCarouselController,
        itemBuilder: (context, index, realIndex) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              padding: EdgeInsetsDirectional.only(top: 15.h, end: 40.w),
              // width:0.8.sw,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/bmwi8.jpg')),
                borderRadius: BorderRadius.all(Radius.circular(25.r)),
              ),
            ),
          );
        },
        itemCount: 3,
        options: CarouselOptions(
          autoPlay: true,
          initialPage: 0,
          height: 230.h,
          viewportFraction: 0.8,
          enlargeFactor: 0.005,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          // viewportFraction: 1,
          // onPageChanged: indexes == 1
          //     ? controller.onPageChanged1
          //     : controller.onPageChanged2,
        ),
      ),
    );
  }
}

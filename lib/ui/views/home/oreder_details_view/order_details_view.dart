import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/custom_widget/custom_row_service.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView(
      {super.key, required this.item, required this.service});

  final List<List<String>> item;
  final ServiceItem service;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            ListView(physics: const NeverScrollableScrollPhysics(), children: [
          const CustomAppBar(
            title: 'Order Details',
            existAppBar: true,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.mainColor.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 1,
                    offset: const Offset(0, 2),
                  ),
                ]),
            width: 1.sw,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/${service.image}.png',
                  width: 100.w,
                  height: 100.h,
                ),
                (10.w).pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: service.name!,
                      textType: TextStyleType.title,
                      fontWeight: FontWeight.bold,
                    ),
                    (10.h).ph,
                    CustomText(
                      text: service.servicesAvailable == null
                          ? '120 Zontrike point'
                          : '${service.servicesAvailable} Services Available',
                      textType: TextStyleType.bodyBig,
                    ),
                  ],
                )
              ],
            ),
          ),
          ...List.generate(
              item.length,
              (index) => CustomRowService(
                    item: item[index],
                  ))
        ]),
      ),
    );
  }
}

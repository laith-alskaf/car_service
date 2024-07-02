
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../home_view_controller.dart';

class ContainerSubscription extends StatelessWidget {
   ContainerSubscription({super.key});
   HomeViewController controller =Get.find();
   @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.h,
      width: 1.sw,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color:  AppColors.mainColor.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
        // borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.h),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                const Spacer(),
                CustomText(text: "Free", textType: TextStyleType.bodyBig,textColor: AppColors.blueColor,),
                (30.w).pw,
                CustomText(text: "Permuim",  textType: TextStyleType.bodyBig,textColor: AppColors.blueColor,),


              ],
            ),
            (20.h).ph,
            ...List.generate(controller.proInfo.length, (index) {
              return Row(
                children: [
                  SizedBox(
                    width: 340.w,
                    child: CustomText(text: '- '+controller.proInfo[index],

                      fontSize: 14.h,
                      fontWeight: FontWeight.bold,
                      textType: TextStyleType.body,textColor: AppColors.blueColor,),
                  ),
                  SizedBox(
                    width: 150.w,
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/ph_x-bold.svg"),
                        (70.w).pw,
                        SvgPicture.asset("assets/images/icon-park-outline_correct.svg"),
                      ],
                    ),
                  )




                ],
              );
            },),
            // Row(
            //   children: [
            //     CustomText(text: "wash your car up to 3 times a month",
            //       fontSize: 14.h,
            //       fontWeight: FontWeight.bold,
            //       textType: TextStyleType.body,textColor: AppColors.blueColor,),
            //     (40.w).pw,
            //     SvgPicture.asset("assets/images/ph_x-bold.svg"),
            //     (70.w).pw,
            //     SvgPicture.asset("assets/images/icon-park-outline_correct.svg"),
            //
            //
            //
            //   ],
            // ),
          ],
        ),
      ),

    );
  }
}

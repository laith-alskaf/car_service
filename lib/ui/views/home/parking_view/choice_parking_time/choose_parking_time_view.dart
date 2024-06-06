import 'package:car_service/core/translation/app_translation.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/parking_view/choice_parking_time/choose_parking_time_controller.dart';
import 'package:car_service/ui/views/home/parking_view/choice_parking_time/parking_time_contenar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../shared/colors.dart';
import 'custom_date.dart';

class ChooseParkingTimeView extends StatefulWidget {
  const ChooseParkingTimeView({super.key});

  @override
  State<ChooseParkingTimeView> createState() => _ChooseParkingTimeViewState();
}

class _ChooseParkingTimeViewState extends State<ChooseParkingTimeView> {
  ChooseParkingViewController controller = Get.put(ChooseParkingViewController());

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: ListView(children: [
         CustomAppBar(
          title: tr("Parking"),
        ),
        (170.h).ph,

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: tr("Select Date and Start Hour"), textType: TextStyleType.title),
              (20.h).ph,
              Obx(() => Row(

                children: [

                  ContainerDate(date: controller.birthDay.value,
                  ontap:()=> controller.selectDate()
                  ),
                  SizedBox(width: 20.h,),
                  ContainerDate(date: controller.time.value,
                  ontap:()=> controller.selectTime()
                  ),
                ],
              )),
              (100.h).ph,
              CustomText(text: tr("Parking Time"), textType: TextStyleType.title),
              (20.h).ph,

              Obx(
                      () =>   Row(
                children: [

                  ParkingTimeContenar(
                    hours:"2 hours" ,
                    payment: "2000 syp" ,
                    color:controller. selectedContainer.value == 0 ? AppColors.mainColor: Colors.white ,
                    colortext:controller. selectedContainer.value == 0 ? AppColors.whiteColor: Colors.black ,
                    ontap:()=>controller.selectedContainer.value = 0 ,

                  ),
                  ParkingTimeContenar(
                    hours:"2 hours" ,
                    payment: "3000 syp" ,
                    color:controller. selectedContainer.value == 1 ? AppColors.mainColor: Colors.white ,
                    colortext:controller. selectedContainer.value == 1 ? AppColors.whiteColor: Colors.black ,
                    ontap:()=>controller.selectedContainer.value = 1,

                  ),
                  ParkingTimeContenar(
                    hours:"3 hours" ,
                    payment: "4000 syp" ,
                    color:controller. selectedContainer.value == 2 ? AppColors.mainColor: Colors.white ,
                    colortext:controller. selectedContainer.value == 2 ? AppColors.whiteColor: Colors.black ,
                    ontap:()=>controller.selectedContainer.value = 2,

                  ),
                  ParkingTimeContenar(
                    hours:"4 hours" ,
                    payment: "5000 syp" ,
                    color:controller. selectedContainer.value == 3 ? AppColors.mainColor: Colors.white ,
                    colortext:controller. selectedContainer.value == 3 ? AppColors.whiteColor: Colors.black ,
                    ontap:()=>controller.selectedContainer.value = 3,

                  ),

                ],
              )),
              (20.h).ph,
              CustomText(text: tr("Parking Time"), textType: TextStyleType.title),
              (40.h).ph,
             Center(child: CustomButton(text: "next", buttonTypeEnum: ButtonTypeEnum.big)),
              (20.h).ph,
              Center(child: CustomText(text: "cansel", textType: TextStyleType.title,
              textColor: AppColors.mainColor,)),
















            ],
          ),
        ),






      ]),
    );
  }
}

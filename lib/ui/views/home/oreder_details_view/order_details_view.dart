import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/custom_widget/custom_row_service.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_order_continer.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView(
      {super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Padding(
          padding: EdgeInsets.symmetric(vertical: 90.h,horizontal: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/done.png"),
              (0.04.sh).ph,
              CustomText(text:"Your Problem Has been Placed Sucessfuly" , textType: TextStyleType.bodyBig,fontSize: 19.h,),
              (0.1.sh).ph,
              CustomOrderContiner(location: "location",
                  your_problem: "your_problem", img: "referach", appointment_time:"20:12"  ,
                  estimated_time:"20:15")


            ],

          ),
        )

      ),
    );
  }
}

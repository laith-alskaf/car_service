import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../reapair_widget/custom_order_continer.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/done.png"),
        (0.04.sh).ph,
        CustomText(
          text: 'Your Problem Has been Placed Sucessfuly',
          textType: TextStyleType.subtitle,
          fontWeight: FontWeight.bold,
          fontSize: 25.sp,
        ),
        (0.05.sh).ph,
        const CustomOrderContainer(
            location: "location",
            yourProblem: "your_problem",
            img: "referach",
            appointmentTime: "20:12",
            estimatedTime: "20:15")
      ],
    );
  }
}

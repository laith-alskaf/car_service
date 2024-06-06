
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';

class ParkingTimeContenar extends StatelessWidget {
  final Color? color ;
  final Color? colortext ;
  final Function()? ontap;
  final String  hours;
  final String  payment;


  const ParkingTimeContenar({Key? key, required this.color, this.ontap, this.colortext, required this.hours, required this.payment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: InkWell(
        onTap: ontap,

        child: Container(
          decoration: BoxDecoration(
            color:color??AppColors.whiteColor,
            border: Border.all(color: AppColors.blackColor)
          ),
          child: Column(
            children: [
              CustomText(text: hours, textType: TextStyleType.body,
              textColor: colortext??AppColors.blackColor,),
              CustomText(text: payment, textType: TextStyleType.body,
                textColor: colortext??AppColors.blackColor,),
            ],
          ),
        ),
      ),
    );
  }
}

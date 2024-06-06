
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class ContainerDate extends StatelessWidget {
  final String date;
  final Function()? ontap;
  const ContainerDate({Key? key, required this.date, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ontap,

      child: Container(
        width: 190.h,
        height: 90.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.mainColor,
          ),
        ),
          child: Row(

            children: [
              SizedBox(width: 10.h,),

              SvgPicture.asset('assets/images/home_time.svg',
            ),
            SizedBox(width: 20.h,),
            CustomText(
              text: date,
              textType: TextStyleType.body,
            ),
          ],
        ),
      ),
    );
  }
}



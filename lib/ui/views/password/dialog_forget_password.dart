import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/general_util.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widget/custom_button.dart';
import '../../shared/custom_widget/custom_text.dart';

class CustomDialogPassword extends StatelessWidget {
  const CustomDialogPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20)),
        height: 300.h,
        width: 1.sw,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: defaultPadding),
          child: Column(
            children: [
              (40.h).ph,
              SvgPicture.asset(
                  "assets/images/ic_email.svg"),
              (20.h).ph,
              CustomText(
                text: "Check Your Email",
                textType: TextStyleType.title,
                textColor: AppColors.mainColor,
              ),
              (10.h).ph,
              CustomText(
                text:
                "we sent a password reset link to your email",
                textType: TextStyleType.body,
                textColor:
                AppColors.blackColor.withOpacity(0.6),
              ),
              (30.h).ph,
              CustomButton(
                  width: 1.sw,
                  height:40.h ,
                  text: "Check Email",
                  buttonTypeEnum: ButtonTypeEnum.normal)
            ],
          ),
        ),
      ),
    );
  }
}

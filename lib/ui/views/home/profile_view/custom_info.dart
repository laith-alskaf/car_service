import 'package:animate_do/animate_do.dart';
import 'package:car_service/core/translation/app_translation.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_container.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/profile_view/custom_row_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class CustomInfo extends StatelessWidget {
  const CustomInfo({
    super.key,
    this.textBody,
    required this.title,
    this.titleIcon,
    this.suffixText,
    this.onTap,
  });

  final List<String>? textBody;
  final String title;
  final String? suffixText;
  final bool? titleIcon;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
        duration: const Duration(milliseconds: 600),
        child: CustomContainer(
          borderSide: BorderRadiusDirectional.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1.0,
              blurRadius: 5.0,
              offset: const Offset(0, 0),
            ),
          ],
          paddingContent: EdgeInsetsDirectional.only(
              start: 40.w, end: 40.w, top: 25.h, bottom: 27.h),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: CustomRowInfo(
                    title: title,
                    suffixText: suffixText,
                  ),
                ),
                Divider(color: AppColors.mainColor, thickness: 0.2),
                //________________________________________________________________
                if (textBody != null) ...[
                  ...List.generate(textBody!.length, (index) {
                    return CustomText(
                      bottomPadding: 5.h,
                      text: textBody![index],
                      textType: TextStyleType.body,
                      fontWeight: FontWeight.normal,
                    );
                  })
                ]
                //________________________________________________________________

                else if (textBody == null) ...[
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/star.png',
                        width: 26.w,
                        height: 26.w,
                      ),
                      (10.w).pw,
                      CustomText(
                        text: tr('key_places'),
                        textType: TextStyleType.body,
                        fontWeight: FontWeight.normal,
                      ),
                      (51.w).pw,
                      const CustomText(
                        text: '0',
                        textType: TextStyleType.body,
                        fontWeight: FontWeight.normal,
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/images/love.png',
                        width: 26.w,
                        height: 26.w,
                      ),
                      (10.w).pw,
                      CustomText(
                        text: tr('key_products'),
                        textType: TextStyleType.body,
                        fontWeight: FontWeight.normal,
                      ),
                      (51.w).pw,
                      const CustomText(
                        text: '0',
                        textType: TextStyleType.body,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  )
                ]
              ],
            ),
          ),
        ));
  }
}

import 'package:car_service/ui/admin_view/admin_profile_view/admin_profile_controller.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/views/home/profile_view/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomRowInfoAdmin extends StatelessWidget {
  const CustomRowInfoAdmin({
    super.key,
    required this.title,
    this.suffixText,
    this.titleIcon,
    this.subTitle,
    required this.index,
    this.isEdit,
  });

  final String title;
  final String? suffixText;
  final bool? titleIcon;
  final bool? subTitle;
  final int index;
  final bool? isEdit;

  @override
  Widget build(BuildContext context) {
      AdminProfileController controller = Get.find();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          textType:
              subTitle ?? false ? TextStyleType.bodyBig : TextStyleType.body,
          fontWeight: FontWeight.bold,
        ),
        CustomText(
          textColor: AppColors.mainColor,
          text: suffixText ?? '',
          textType: TextStyleType.body,
        ),
        if (isEdit == true) ...[
          const Spacer(),
          Obx(() => Transform.flip(
              flipY: controller.expandedContainer[index],
              child: Icon(
                Icons.arrow_drop_down_outlined,
                size: 35.w,
              )))
        ]
      ],
    );
  }
}

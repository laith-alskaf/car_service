import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';


class CustomRowInfo extends StatelessWidget {
  const CustomRowInfo({
    super.key,
    required this.title,
    this.suffixText,
    this.titleIcon,
    this.subTitle,
  });

  final String title;
  final String? suffixText;
  final bool? titleIcon;
  final bool? subTitle;


  @override
  Widget build(BuildContext context) {
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
        )
      ],
    );
  }
}

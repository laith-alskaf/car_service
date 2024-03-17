import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/shared/utils.dart';

enum ButtonTypeEnum {
  big,
  normal,
  small,
  custom,
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonTypeEnum,
    this.text,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    required this.onPressed,
    this.imageName,
    this.width,
    this.height,
    this.imageColor,
    this.imageWidth,
    this.imageHeight,
    this.fontWeight,
    this.fontSize,
  });

  final ButtonTypeEnum buttonTypeEnum;
  final String? text;
  final String? imageName;
  final Color? imageColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;
  final Function? onPressed;
  final double? width;
  final double? height;
  final double? imageWidth;
  final double? imageHeight;
  final double? fontSize;
  final FontWeight? fontWeight;

  Map<String, dynamic> chooseButtonType() {
    switch (buttonTypeEnum) {
      case ButtonTypeEnum.normal:
        return {
          "width": screenWidth(1.25),
          "height": screenHeight(13),
          "backgroundColor": AppColors.mainColor,
          "textColor": AppColors.mainColor,
          "borderColor": borderColor,
          "fontSize": screenWidth(21),
          "fontWeight": FontWeight.bold,
        };

      case ButtonTypeEnum.small:
        return {
          "width": screenWidth(3.6),
          "height": screenWidth(9),
          "backgroundColor": AppColors.mainColor,
          "textColor": AppColors.mainColor,
          "borderColor": borderColor,
          "fontSize": screenWidth(21),
          "fontWeight": FontWeight.bold,
        };

      case ButtonTypeEnum.big:
        return {
          "width": screenWidth(1.25),
          "height": screenWidth(13),
          "backgroundColor": AppColors.mainColor,
          "textColor": AppColors.mainColor,
          "borderColor": borderColor,
          "fontSize": screenWidth(21),
          "fontWeight": FontWeight.bold,
        };
      case ButtonTypeEnum.custom:
        return {
          "width": width,
          "height": height,
          "backgroundColor": backgroundColor,
          "textColor": textColor,
          "borderColor": borderColor,
          "fontSize": fontSize,
          "fontWeight": fontWeight,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> enumResult = chooseButtonType();

    return SizedBox(
      width: width ?? enumResult["width"] ?? screenWidth(1.1),
      height: height ?? enumResult["height"] ?? screenHeight(16),
      child: ElevatedButton(
        onPressed: () {
          if (onPressed != null) onPressed!();
        },
        style: ElevatedButton.styleFrom(
          side: (borderColor != null || enumResult["borderColor"] != null)
              ? BorderSide(
                  width: 1.0,
                  color: borderColor ?? enumResult["borderColor"],
                )
              : null,
          backgroundColor: backgroundColor ??
              enumResult["backgroundColor"] ??
              AppColors.mainColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          // fixedSize: Size(
          //   width ?? screenWidth(1.1),
          //   height ?? screenHeight(12),
          // ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageName != null) ...[
              SvgPicture.asset(
                'assets/images/$imageName.svg',
                width: imageWidth,
                height: imageHeight,
                color: imageColor,
              ),
              (screenWidth(20)).pw,
            ],
            CustomText(
              textType: TextStyleType.custom,
              text: text ?? "",
              textColor: textColor ?? enumResult["textColor"],
              //fontWeight: fontWeight ?? FontWeight.bold,
              fontSize: fontSize ?? enumResult["fontSize"] ?? screenWidth(25),
            ),
          ],
        ),
      ),
    );
  }
}

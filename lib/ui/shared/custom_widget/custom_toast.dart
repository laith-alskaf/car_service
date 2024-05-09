import 'package:bot_toast/bot_toast.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:car_service/core/enums/message_type.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/shared/utils.dart';

class CustomToast {
  static showMessage(
      {required String message, MessageType? messageType = MessageType.INFO}) {
    String imageName = 'info';
    Color shadowColor = AppColors.mainColor;
    switch (messageType) {
      case MessageType.REJECTED:
        imageName = 'rejected-01';
        shadowColor = AppColors.mainRedColor;
        break;
      case MessageType.SUCCESS:
        imageName = 'approved1-01';
        shadowColor = Colors.green;
        break;
      case MessageType.WARNING:
        imageName = 'warning';
        shadowColor = Colors.orange;
        break;
      default:
        break;
    }
    BotToast.showCustomText(
        duration: const Duration(seconds: 3),
        toastBuilder: (value) {
          return Container(
            padding: const EdgeInsets.only(top: 5),
            width: screenWidth(1.3),
            decoration: BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 2),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/images/$imageName.svg',
                  width: screenWidth(6),
                  height: screenWidth(6),
                ),
                15.ph,
                CustomText(
                  text:message,
                  textType: TextStyleType.title,
                  fontWeight: FontWeight.bold,
                  startPadding: 20.w,
                  textColor: AppColors.whiteColor,
                  endPadding: 20.w,
                  isTextAlign: TextAlign.center,
                ),
                15.ph,
              ],
            ),
          );
        });
  }
}

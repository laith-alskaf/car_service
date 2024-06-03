import 'package:car_service/core/translation/app_translation.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/sign_up_view/sign_up_view_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomDropMenu extends StatelessWidget {
   CustomDropMenu({super.key, required this.items, this.onSaved});

  final List<String> items;
  final Function(String?)? onSaved;
  SignUpViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DropdownButtonFormField2<String>(
        style: TextStyle(color: AppColors.mainColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10.h),
          hintText: tr('Car Type'),
          hintStyle: TextStyle(color: AppColors.grayColor),
          fillColor: AppColors.blackColor.withOpacity(0.02),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: AppColors.mainColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: AppColors.mainColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: AppColors.mainColor,
            ),
          ),
        ),
        items: items.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(

            value: value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  startPadding: 15.w,
                  text: value,
                  textColor: AppColors.blackColor,
                  textType: TextStyleType.body,
                  fontWeight: FontWeight.normal,
                ),
                Visibility(
                  visible: items.last != value,
                  child: const Divider(
                    color: AppColors.blackColor,
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
                ),
                if (items.last != value) (2.h).ph,
              ],
            ),
          );
        }).toList(),
        selectedItemBuilder: (BuildContext context) {
          return items.map<Widget>((String value) {
            return CustomText(
              text: value,
              textType: TextStyleType.body,
              fontWeight: FontWeight.normal,
            );
          }).toList();
        },
        validator: (value) {
          if (value == null) {
            return 'Please select Type';
          }
          else{
            controller.carType.value=value;
          }
          return null;
        },
        onChanged: (value) {},
        onSaved: onSaved,
        iconStyleData: const IconStyleData(),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 300,
          decoration: BoxDecoration(color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        ),
      ),
    );
  }
}

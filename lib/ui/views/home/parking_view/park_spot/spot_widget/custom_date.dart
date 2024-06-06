import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text_field.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ContainerDate extends StatelessWidget {
  final Future ontap;
  final TextEditingController controller;

  const ContainerDate({super.key,required this.ontap, required this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
       await ontap;
      },
      child: CustomTextFormField(
        prefixIcon: 'home_time',
        widthContainer: 160.w,
        hintTextSize: 30.h,
        readOnly: true,
        hintText: '',
        controller: controller,
      ),
    );
  }
}

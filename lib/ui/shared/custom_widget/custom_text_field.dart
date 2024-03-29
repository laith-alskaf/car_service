import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/utils.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.fillColor,
    this.hintTextColor,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.hintTextSize,
    this.maxLines,
    this.onFieldSubmitted,
    this.onChanged,
    this.suffixOnTap,
    this.heightContainer,
    this.widthContainer,
    this.contentPadding,
  });

  final String hintText;
  final TextEditingController? controller;
  final Color? fillColor;
  final Color? hintTextColor;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String? prefixIcon;
  final Color? prefixIconColor;
  final String? suffixIcon;
  final Function()? suffixOnTap;
  final Color? suffixIconColor;
  final double? hintTextSize;
  final double? heightContainer;
  final double? widthContainer;
  final EdgeInsets? contentPadding;
  final int? maxLines;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightContainer,
      width: widthContainer,
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        maxLines: maxLines ?? 1,
        onChanged: onChanged,
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        textAlign: TextAlign.start,
        cursorColor: AppColors.mainColor,
        decoration: InputDecoration(
          // prefixIcon: UnconstrainedBox(
          //   child: SvgPicture.asset(
          //     'assets/svgs/$prefixIcon.svg',
          //     color: prefixIconColor ?? AppColors.mainOrangeColor,
          //     width: screenWidth(15),
          //   ),
          // ),
          suffixIcon: suffixIcon != null
              ? InkWell(
                  onTap: suffixOnTap,
                  child: Transform.scale(
                    scale: 0.5,
                    child: SvgPicture.asset(
                      'assets/images/$suffixIcon.svg',
                      width: screenWidth(15),
                    ),
                  ),
                )
              : null,
          suffixIconColor: suffixIconColor,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.mainColor,
            ),
            borderRadius: BorderRadius.circular(15.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: AppColors.mainColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.mainColor,
            ),
            borderRadius: BorderRadius.circular(15.r),
          ),
          filled: true,
          hintStyle: TextStyle(
            color: hintTextColor ?? AppColors.grayColor,
            fontSize: hintTextSize ?? screenWidth(24),
          ),
          hintText: hintText,
          fillColor: fillColor ?? AppColors.whiteColor,
        ),
        keyboardType: keyboardType ?? TextInputType.text,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}

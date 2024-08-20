import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final void Function(String)? onChange;
  final String? hintText ;
    final IconData? prefixIcon ;


  const CustomTextField({ this.onChange, this.prefixIcon , this.hintText ,  super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: TextStyle(
            fontSize: AppSize.s14.sp,
            fontWeight: FontWeight.normal,
            color: ColorManager.primary),
        cursorColor: ColorManager.primary,
        onChanged: onChange ,
        decoration: InputDecoration(
          border: buildCustomBorder(),
          enabledBorder: buildCustomBorder(),
          focusedBorder: buildCustomBorder().copyWith(
            borderSide: BorderSide(
              color: ColorManager.primary,
              width: AppSize.s2.toDouble(),
            ),
          ),
          contentPadding: EdgeInsets.all(16.h),
          hintStyle: TextStyle(
              fontSize: AppSize.s14.sp,
              fontWeight: FontWeight.normal,
              color: ColorManager.primary),
          hintText: hintText,
          prefixIcon: prefixIcon == null ? null : Icon(
                prefixIcon,
                size: AppSize.s28.sp,
                color: ColorManager.primary.withOpacity(0.75),
              )
        ));
  }

  OutlineInputBorder buildCustomBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.circular(AppSize.s40.r));
  }
}

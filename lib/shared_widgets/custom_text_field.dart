import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final void Function(String)? onChange;
  final String? hintText ;
    final Widget? prefixIcon ;


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
              color: ColorManager.primaryDark.withOpacity(.6)),
          hintText: hintText,
          
          prefixIcon: prefixIcon == null ? null : Padding(

            padding:  EdgeInsets.only(left: AppSize.s14.w),
            child: 
                  prefixIcon,
                
          )
        ));
  }

  OutlineInputBorder buildCustomBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.circular(AppSize.s28.r));
  }
}

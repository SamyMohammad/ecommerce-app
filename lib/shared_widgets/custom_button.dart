import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/shared_widgets/custom_txt_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.onPressed, required this.text, super.key});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s16.r)
        ),
    padding: EdgeInsets.symmetric(vertical: AppSize.s14.h , horizontal: AppSize.s10.w),
        backgroundColor: ColorManager.primary
      ),
        onPressed: onPressed,
        child: CustomTextWgt(
          maxLines: 1,
          data: text,
         fontSize: AppSize.s8.sp,
          textStyle:
              getRegularStyle(color: ColorManager.white )
        ));
  }
}

import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorAndSizeCartItem extends StatelessWidget {
  const ColorAndSizeCartItem({
    super.key,
    required this.color,
    required this.colorName,
    required this.size,
  });
  final Color color;
  final String colorName;
  final int size;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 7.5.r,
          backgroundColor: color,
        ),
        SizedBox(width: 5.w),
        Text(
          colorName,
          style: getRegularStyle(
            color: ColorManager.textColor.withOpacity(0.5),
            fontSize: AppSize.s14.sp,
          ),
        ),
        SizedBox(width: 5.w),
        Container(
          width: 2.w,
          height: 18.h,
          decoration: BoxDecoration(
            color: ColorManager.grey1,
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        SizedBox(width: 5.w),
        Text(
          'Size: $size',
          style: getRegularStyle(
              color: ColorManager.textColor.withOpacity(0.5),
              fontSize: AppSize.s14.sp),
        ),
      ],
    );
  }
}

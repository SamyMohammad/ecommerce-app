import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomElevatedButton extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String data;
  final void Function() onTap;
  const CustomElevatedButton({super.key , this.prefixIcon , this.suffixIcon , required this.data , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        padding: const EdgeInsets.all(15),
      ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon ?? const SizedBox(),
            SizedBox(width: 24.w,),
            Text(
              data,
              style: getMediumStyle(color: ColorManager.white).copyWith(fontSize: 20.sp),
            ),
            SizedBox(width: 27.w,),
            suffixIcon ?? const SizedBox()
          ],
        ));
  }
}

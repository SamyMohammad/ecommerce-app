import 'package:e_commerce/Ui_Layer/Utils/my_assets.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  void Function()? onTap;

  SearchTextField({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: const Color.fromRGBO(6, 0, 79, 0.6)),
        cursorColor: MyColors.primaryColor,
        onTap: onTap,
        decoration: InputDecoration(
          border: buildCustomBorder(),
          enabledBorder: buildCustomBorder(),
          focusedBorder: buildCustomBorder().copyWith(
            borderSide: const BorderSide(
              color: MyColors.primaryColor,
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.all(16.h),
          hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: const Color.fromRGBO(6, 0, 79, 0.6)),
          hintText: "what do you search for?",
          prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 32.sp,
                color: MyColors.primaryColor.withOpacity(0.75),
              )),
        ));
  }

  OutlineInputBorder buildCustomBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(
          color: MyColors.primaryColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(50.r));
  }
}

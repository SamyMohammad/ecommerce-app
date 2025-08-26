import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/resources/color_manager.dart';

class CartItemShimmer extends StatelessWidget {
  const CartItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        height: isPortrait ? height * 0.14 : width * 0.23,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            // صورة المنتج
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border:
                Border.all(color: ColorManager.primary.withOpacity(0.3)),
              ),
              child: Container(
                height: isPortrait ? height * 0.142 : height * 0.23,
                width: isPortrait ? width * 0.29 : 165.w,
                color: Colors.grey[300],
              ),
            ),
            // تفاصيل المنتج
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 8.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // العنوان و زر الحذف
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 16.h,
                            color: Colors.grey[300],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          height: 22.h,
                          width: 22.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // اللون والمقاس
                    Container(
                      height: 14.h,
                      width: 100.w,
                      color: Colors.grey[300],
                    ),
                    const Spacer(),
                    // السعر و العداد
                    Row(
                      children: [
                        Container(
                          height: 16.h,
                          width: 60.w,
                          color: Colors.grey[300],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Container(
                              height: 28.h,
                              width: 28.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[300],
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              height: 18.h,
                              width: 20.w,
                              color: Colors.grey[300],
                            ),
                            SizedBox(width: 8.w),
                            Container(
                              height: 28.h,
                              width: 28.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[300],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

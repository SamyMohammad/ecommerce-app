import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key , required this.productDescription});
  final String productDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: getMediumStyle(color: ColorManager.appBarTitleColor)
              .copyWith(fontSize: 18.sp),
        ),
        SizedBox(
          height: 8.h,
        ),
        ReadMoreText(
        productDescription,
          style: getMediumStyle(
              color: ColorManager.appBarTitleColor.withOpacity(.6))
              .copyWith(fontSize: 18.sp),
          trimExpandedText: ' Read Less',
          trimCollapsedText: ' Read More',
          trimLines: 3,
          trimMode: TrimMode.Line,
          colorClickableText: ColorManager.appBarTitleColor,
        ),
        SizedBox(height: 16.h,),
      ],
    );
  }
}

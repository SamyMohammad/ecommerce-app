import 'package:colornames/colornames.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/shared_widgets/custom_txt_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextWgt(
          data: product.title,
          textStyle: getSemiBoldStyle(
              color: ColorManager.primaryDark, fontSize: AppSize.s14.sp),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: AppSize.s10.w),
              width: AppSize.s14.w,
              height: AppSize.s14.w,
              decoration:
                  BoxDecoration(color: product.color, shape: BoxShape.circle),
            ),
            CustomTextWgt(
              data: product.color.colorName,
              textStyle: getRegularStyle(
                  color: ColorManager.primaryDark, fontSize: AppSize.s12.sp),
            ),
          ],
        ),
        Row(
          children: [
            CustomTextWgt(
              data: 'EGP: ${product.finalPrice}  ',
              textStyle: getSemiBoldStyle(
                  color: ColorManager.primaryDark, fontSize: AppSize.s14.sp),
            ),
            product.salePrice == null
                ? const SizedBox.shrink()
                : CustomTextWgt(
                    data: 'EGP: ${product.salePrice}',
                    textStyle: getMediumStyle(color: ColorManager.primaryDark)
                        .copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: ColorManager.primaryDark,
                            fontSize: AppSize.s8.sp)),
          ],
        ),
      ],
    );
  }
}

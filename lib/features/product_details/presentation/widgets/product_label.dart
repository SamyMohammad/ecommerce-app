import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/data/model/products/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductLabel extends StatelessWidget {
  const ProductLabel({super.key , required this.product});

final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
             "${product.title}",
              style: getMediumStyle(color: ColorManager.primary)
                  .copyWith(fontSize: 18.sp),
            )),
        Text(
          "EGP  ${product.priceAfterDiscount??'0'}",
          style: getMediumStyle(color: ColorManager.primary)
              .copyWith(fontSize: 18.sp),
        ),
      ],
    );
  }
}

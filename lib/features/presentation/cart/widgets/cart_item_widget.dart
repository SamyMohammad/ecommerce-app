import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/product_counter.dart';
import 'package:ecommerce_app/features/presentation/cart/widgets/color_and_size_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.color,
    required this.colorName,
    required this.size,
    required this.price,
    required this.onDeleteTap,
    required this.quantity,
    required this.onIncrementTap,
    required this.onDecrementTap,
  });
  final String imagePath;
  final String title;
  final Color color;
  final String colorName;
  final int size;
  final int price;
  final void Function() onDeleteTap;
  final int quantity;
  final void Function(int value) onIncrementTap;
  final void Function(int value) onDecrementTap;
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      height: isPortrait ? 165.h : 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
      ),
      child: Row(children: [
        // display image in the container
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: isPortrait ? 165.h : 100.w,
            width: isPortrait ? 130.w : 165.w,
          ),
        ),
        SizedBox(width: 8.w),
        // display details product=========================
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title and delete button ==
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: getMediumStyle(
                        color: ColorManager.textColor,
                        fontSize: AppSize.s18.sp,
                      ),
                    ),
                    IconButton(
                      onPressed: onDeleteTap,
                      icon: ImageIcon(
                        const AssetImage(IconsAssets.icDelete),
                        color: ColorManager.textColor,
                        size: 24.h,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 6.h),

                // display color and size===================
                ColorAndSizeCartItem(
                  color: color,
                  colorName: colorName,
                  size: size,
                ),
                SizedBox(height: 6.h),
                // display price and quantity =================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'EGP $price',
                      style: getMediumStyle(
                          color: ColorManager.textColor,
                          fontSize: AppSize.s18.sp),
                    ),
                    ProductCounter(
                      add: onIncrementTap,
                      productCounter: quantity,
                      remove: onDecrementTap,
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

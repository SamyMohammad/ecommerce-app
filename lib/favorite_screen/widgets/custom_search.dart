import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/shared_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavSearchCartRow extends StatelessWidget {
  const FavSearchCartRow({super.key, this.cartCount = 0, this.onTap});

  final void Function()? onTap;
  final int cartCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.s18.h),
      child: Row(
        children: [
          const Expanded(
            child: CustomTextField(
                hintText: AppConstants.searchHint,
                prefixIcon: Icons.search,
                onChange: null),
          ),
          SizedBox(width: AppSize.s20.w),
          InkWell(
              onTap: onTap,
              child: Badge(
                alignment: AlignmentDirectional.topStart,
                backgroundColor: ColorManager.primary,
                label: Text(cartCount.toString()),
                child: ImageIcon(
                  const AssetImage(ImageAssets.shoppingCart),
                  size: AppSize.s28.sp,
                  color: ColorManager.primary,
                ),
              ))
        ],
      ),
    );
  }
}

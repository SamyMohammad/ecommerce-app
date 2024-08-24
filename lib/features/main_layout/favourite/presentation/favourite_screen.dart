import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSize.s14.w, vertical: AppSize.s10.h),
        child: ListView.builder(
          itemCount: AppConstants.favoriteProducts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
              child:
                  FavoriteItem(product: AppConstants.favoriteProducts[index]),
            );
          },
        ));
  }
}

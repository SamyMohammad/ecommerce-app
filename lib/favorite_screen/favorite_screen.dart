import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/favorite_screen/widgets/custom_search.dart';
import 'package:ecommerce_app/favorite_screen/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              ImageAssets.routeLogo,
              height: AppSize.s28.h,
              width: AppSize.s60.w,
              fit: BoxFit.fill,
            ),
            FavSearchCartRow(
              onTap: () {
                //TODO:search for product in favorite list
              },
            ),
            SizedBox(
              height: AppSize.s16.h,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: AppConstants.favoriteProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSize.s20.h),
                  child: Slidable(
                    key: ValueKey<int>(index),
                    startActionPane: ActionPane(
                      extentRatio: 0.3.w,
                      motion: const DrawerMotion(),
                      children: [
                        SlidableAction(
                          borderRadius: BorderRadius.circular(AppSize.s16.r),
                          autoClose: true,
                          onPressed: (context) {
                            //TODO: remove the product from favorite list
                          },
                          backgroundColor: ColorManager.error,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: AppConstants.delete,
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSize.s10.w,
                              vertical: AppSize.s10.h),
                        ),
                      ],
                    ),
                    child: FavoriteItem(
                        product: AppConstants.favoriteProducts[index]),
                  ),
                );
              },
            ))
          ],
        ),
      )),
    );
  }
}

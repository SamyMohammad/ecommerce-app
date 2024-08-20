import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Domain_Layer/Entities/product_response_entity.dart';
import 'package:e_commerce/Ui_Layer/Utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Domain_Layer/dependency_injection.dart';
import '../../Products_Tab/Cubit/products_tab_view_model.dart';

class FavoriteItem extends StatelessWidget {
  FavoriteItem({super.key, required this.product});

  ProductEntity? product;

  ProductTabViewModel viewModel = ProductTabViewModel(
      productsUseCase: injectGetAllProductsUseCase(),
      addToCartUseCase: injectAddToCartUseCase());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: MyColors.lightGreyColor, width: 1.w)),
      width: 398.w,
      height: 113.h,
      child: Row(
        children: [
          ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(15.r),
            child: CachedNetworkImage(
              width: 130.w,
              height: 113.h,
              fit: BoxFit.fill,
              imageUrl: product?.imageCover ?? "",
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: MyColors.yellowColor,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: MyColors.redColor,
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          product?.title ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontSize: 16.sp,
                                  color: MyColors.primaryColor,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Icon(
                        Icons.favorite_rounded,
                        color: MyColors.primaryColor,
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Text("Color : null",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: MyColors.primaryColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "Egp : ${product?.price}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 16.sp,
                                color: MyColors.primaryColor,
                                fontWeight: FontWeight.w500),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        viewModel.addProductToCart(product?.id ?? "");
                      },
                      child: Container(
                        height: 36,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: MyColors.primaryColor,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Center(
                          child: Text(
                            "Add To Cart",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.whiteColor),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

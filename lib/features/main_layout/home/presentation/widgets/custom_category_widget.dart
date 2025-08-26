import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/data/model/categories_models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes_manager/routes.dart';
import '../../../../products_screen/presentation/screens/Products_catalog_argument.dart';

class CustomCategoryWidget extends StatelessWidget {
  const CustomCategoryWidget({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      Navigator.pushNamed(context, Routes.productsScreenRoute,arguments:ProductsCatalogArgument(
          category: category.id),
      );

    },



      child: Column(
        children: [
          // CachedNetworkImage(
          //   height: 100,
          //   width: 100,
          //   fit: BoxFit.cover,
          //   imageUrl: ImageAssets.categoryHomeImage,
          //   placeholder: (context, url) =>
          //       const Center(child: CircularProgressIndicator()),
          //   errorWidget: (context, url, error) =>
          //       const Center(child: Icon(Icons.error)),
          //   imageBuilder: (context, imageProvider) {
          //     return Container(
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         image: DecorationImage(
          //           image: imageProvider,
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     );
          //   },
          // ),

          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Container(
              height: 100.h,
              width: 100.w,
              child:CachedNetworkImage(
                imageUrl: category.image ?? "",
                imageBuilder: (context, imageProvider) => Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            ),
          ),

          SizedBox(height: 8.h),
          Text(
            category.name ?? "",
            style: getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}

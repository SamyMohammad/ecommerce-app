import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:ecommerce_app/data/model/products/product.dart';
import 'package:ecommerce_app/features/cart/manger/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomProductWidget extends StatelessWidget {
  final double width;
  final double height;
  final Product product;

  const CustomProductWidget({
    super.key,
    required this.width,
    required this.height,
    required this.product,
  });

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 2) {
      return title;
    } else {
      return "${words.sublist(0, 2).join(' ')}..";
    }
  }

  String truncateDescription(String description) {
    List<String> words = description.split(RegExp(r'[\s-]+'));
    if (words.length <= 4) {
      return description;
    } else {
      return "${words.sublist(0, 4).join(' ')}..";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, Routes.productDetails,
              arguments: product),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.primary.withOpacity(0.3),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  // Not working with the lastest flutter version

                  // CachedNetworkImage(
                  //   imageUrl: image,
                  //   height: height * 0.15,
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  //   placeholder: (context, url) =>
                  //       const Center(child: CircularProgressIndicator()),
                  //   errorWidget: (context, url, error) => const Icon(Icons.error),
                  // ),
                  // Image.network(
                  //   image,
                  //   fit: BoxFit.cover,
                  // ),
                  ClipRRect(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(14.r)),
                    child: Image.network(
                      product.imageCover ?? "",
                      fit: BoxFit.cover,
                      width: width,
                    ),
                  ),
                  Positioned(
                    top: height * 0.01,
                    right: width * 0.02,
                    child: HeartButton(
                      id: product.id ?? "",
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      truncateTitle(product.title ?? ""),
                      style: getMediumStyle(
                        color: ColorManager.textColor,
                        fontSize: 14.sp,
                      ),
                      // maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: height * 0.002),
                    Text(
                      truncateDescription(product.description ?? ""),
                      style: getRegularStyle(
                        color: ColorManager.textColor,
                        fontSize: 14.sp,
                      ),
                      // maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: height * 0.01),
                    SizedBox(
                      width: width * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "EGP ${product.priceAfterDiscount ?? '0'}",
                            style: getRegularStyle(
                              color: ColorManager.textColor,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            "${product.price} ",
                            style: getTextWithLine(),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: height * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          // width: width * 0.22,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Review (${product.ratingsAverage})",
                                style: getRegularStyle(
                                  color: ColorManager.textColor,
                                  fontSize: 12.sp,
                                ),
                              ),
                              const Icon(
                                Icons.star_rate_rounded,
                                color: ColorManager.starRateColor,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: InkWell(
                            onTap: () {
                              context.read<CartCubit>().addCart(
                                  id: product.id ?? '');
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorManager.primary,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

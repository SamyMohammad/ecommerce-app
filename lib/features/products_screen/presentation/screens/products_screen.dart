// import 'package:ecommerce_app/core/resources/color_manager.dart';
// import 'package:ecommerce_app/core/resources/values_manager.dart';
// import 'package:ecommerce_app/domain/repos/ProductsRepo/products_repo.dart';
// import 'package:ecommerce_app/features/products_screen/presentation/manger/products_cubit.dart';
// import 'package:ecommerce_app/features/products_screen/presentation/screens/Products_catalog_argument.dart';
// import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';
//
// import '../../../../core/di/di.dart';
// import '../../../../core/widget/home_screen_app_bar.dart';
//
// class ProductsScreen extends StatelessWidget {
//   ProductsCatalogArgument? productsCatalogArgument;
//   ProductsScreen(this.productsCatalogArgument, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return BlocProvider(
//       create: (context) => ProductsCubit(getIt<ProductsRepo>())
//         ..loadProducts(
//             category: productsCatalogArgument?.category,
//             subCategory: productsCatalogArgument?.subCategory,
//             brand: productsCatalogArgument?.brand),
//       child: Scaffold(
//         backgroundColor: ColorManager.containerGray,
//         appBar: const HomeScreenAppBar(
//           automaticallyImplyLeading: true,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(AppPadding.p16),
//           child: Column(
//             children: [
//               Expanded(
//                 child: BlocBuilder<ProductsCubit, ProductsState>(
//                   builder: (context, state) {
//                     if (state is ProductsSuccess) {
//                       final product = state.product;
//                       return GridView.builder(
//                         itemCount: product.length,
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 8,
//                           mainAxisSpacing: 8,
//                           childAspectRatio: .65,
//                         ),
//                         itemBuilder: (context, index) {
//                           return CustomProductWidget(
//                             product: product[index],
//                             height: height,
//                             width: width,
//                           );
//                         },
//                         scrollDirection: Axis.vertical,
//                       );
//                     } else if (state is ProductsError) {
//                       return Center(
//                         child: Text(state.errorMessage),
//                       );
//                     } else if (state is ProductsEmpty) {
//                       return const Center(
//                         child: Text(
//                           "No products found",
//                           style: TextStyle(fontSize: 30, color: Colors.black),
//                         ),
//                       );
//                     } else {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/domain/repos/ProductsRepo/products_repo.dart';
import 'package:ecommerce_app/features/cart/manger/cart_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/manger/products_cubit.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/Products_catalog_argument.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../core/di/di.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatelessWidget {
  final ProductsCatalogArgument? productsCatalogArgument;

  const ProductsScreen(this.productsCatalogArgument, {super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => ProductsCubit(getIt<ProductsRepo>())
        ..loadProducts(
          category: productsCatalogArgument?.category,
          subCategory: productsCatalogArgument?.subCategory,
          brand: productsCatalogArgument?.brand,
        ),
),
    BlocProvider(
      create: (context) => CartCubit(getIt<ProductsRepo>()),
    ),
  ],
  child: BlocListener<CartCubit, CartState>(
  listener: (context, state) {
    if (state is AddCartSuccess) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message: state.message,
        ),
      );
    } else if (state is AddCartError) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: state.errorMessage,
        ),
      );
    }
  },
  child: Scaffold(
        backgroundColor: ColorManager.containerGray,
        appBar: const HomeScreenAppBar(automaticallyImplyLeading: true),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: BlocBuilder<ProductsCubit, ProductsState>(
            
            builder: (context, state) {
              print("state************builer$state");
              if (state is ProductsSuccess) {
                final products = state.product;

                return GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) => CustomProductWidget(
                    product: products[index],
                    height: height,
                    width: width,
                  ),
                );
              } else if (state is ProductsError) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else if (state is ProductsEmpty) {
                return const Center(
                  child: Text(
                    "No products found",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                );
              } else {
                return  GridView.builder(
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,crossAxisSpacing: 12,
                    mainAxisSpacing: 16
                  ),
                  itemBuilder: (context, index) {
                    return CustomProductShimmer(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 240.h,
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
),
);
  }
}

class CustomProductShimmer extends StatelessWidget {
  final double width;
  final double height;

  const CustomProductShimmer({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 2),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المنتج
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(14.r)),
                child: Container(
                  width: double.infinity,
                  color: Colors.grey,
                ),
              ),
            ),

            // تفاصيل المنتج
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // عنوان المنتج
                    Container(
                      height: 14.h,
                      width: width * 0.6,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 6.h),

                    // وصف
                    Container(
                      height: 12.h,
                      width: width * 0.5,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 6.h),

                    // السعر بعد الخصم و السعر القديم
                    Row(
                      children: [
                        Container(
                          height: 14.h,
                          width: width * 0.25,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 12.w),
                        Container(
                          height: 14.h,
                          width: width * 0.2,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),

                    // المراجعة و زر الإضافة
                    Row(
                      children: [
                        // مراجعة
                        Container(
                          height: 12.h,
                          width: width * 0.3,
                          color: Colors.grey,
                        ),
                        Spacer(),

                        // زر إضافة (+)
                        Container(
                          width: 32.w,
                          height: 32.w,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

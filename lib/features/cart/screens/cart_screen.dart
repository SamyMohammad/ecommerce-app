import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/domain/repos/ProductsRepo/products_repo.dart';
import 'package:ecommerce_app/features/cart/manger/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/features/cart/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/di/di.dart';
import '../../../core/widget/custom_shimmer_item.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key,});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CartCubit(getIt<ProductsRepo>()),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Cart',
//             style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
//           ),
//           centerTitle: true,
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: ImageIcon(
//                 AssetImage(
//                   IconsAssets.icSearch,
//                 ),
//                 color: ColorManager.primary,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: ImageIcon(
//                 AssetImage(IconsAssets.icCart),
//                 color: ColorManager.primary,
//               ),
//             ),
//           ],
//         ),
//         body: BlocBuilder<CartCubit, CartState>(
//           builder: (context, state) {
//             if(state is GetCartSuccess){
//               final products=state.cartResponse;
//               return Padding(
//                 padding: const EdgeInsets.all(AppPadding.p14),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       // the list of cart items ===============
//                       child: ListView.separated(
//                         itemBuilder: (context, index) =>
//                             CartItemWidget(
//                               imagePath: ImageAssets.categoryCardImage,
//                               title: "asvgle",
//                               price: 1500,
//                               quantity: 1,
//                               onDeleteTap: () {},
//                               onDecrementTap: (value) {},
//                               onIncrementTap: (value) {},
//                               size: 40,
//                               color: Colors.black,
//                               colorName: 'Black',
//                             ),
//                         separatorBuilder: (context, index) =>
//                             SizedBox(height: AppSize.s12.h),
//                         itemCount: 2,
//                       ),
//                     ),
//                     // the total price and checkout button========
//                     TotalPriceAndCheckoutBotton(
//                       totalPrice: 1200,
//                       checkoutButtonOnTap: () {},
//                     ),
//                     SizedBox(height: 10.h),
//                   ],
//                 ),
//               );
//             } else if (state is GetCartError) {
//               return Center(child: Text(state.errorMessage));
//             }else{
//               return const Center(child: CircularProgressIndicator());
//             }
//
//           },
//         ),
//       ),
//     );
//   }
// }
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = CartCubit(getIt<ProductsRepo>());
        cubit.getCart(); // استدعاء الداتا عند فتح الشاشة
        return cubit;
      },
      child: Scaffold(
        backgroundColor: ColorManager.containerGray,

        appBar: AppBar(
          backgroundColor: ColorManager.containerGray,

          title: Text(
            'Cart',
            style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(IconsAssets.icSearch),
                color: ColorManager.primary,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(IconsAssets.icCart),
                color: ColorManager.primary,
              ),
            ),
          ],
        ),
        body: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
           if(state is DeleteCartSuccess){
             showTopSnackBar(
               Overlay.of(context),
               const CustomSnackBar.success(
                 message:"This Item Deleted Successfuly" ,
               ),
             );
           }
          },
          builder: (context, state) {

            if (state is GetCartSuccess || state is DeleteCartSuccess) {
              final cartData = (state is GetCartSuccess)
                  ? (state).cartResponse
                  : (state as DeleteCartSuccess).cartResponse;

              final items = cartData.cart;
              final totalPrice = items.fold<num>(0, (sum, item) => sum + item.price * item.count);

              if (items.isEmpty) {
                return const Center(child: Text("Cart is empty"));
              }

              return Padding(
                padding: const EdgeInsets.all(AppPadding.p14),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final product = items[index].product;

                          return CartItemWidget(

                            imagePath: product.imageCover,
                            title: product.title,
                            price: items[index].price *items[index].count,
                            quantity: items[index].count,
                            onDeleteTap: () {
                              context.read<CartCubit>().deleteCart(id: product.id);
                            },
                            onDecrementTap: (val) {
                              if (val > 1) {
                                setState(() {
                                  items[index].count = val - 1;
                                });
                                context.read<CartCubit>().putCart(id: product.id, count: val - 1);
                              }
                            },
                            onIncrementTap: (val) {
                              setState(() {
                                items[index].count=val +1;
                              });
                              context.read<CartCubit>().putCart(id: product.id, count: val + 1);

                            },
                            size: 40,
                            color: Colors.black,
                            colorName: 'Black',
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(height: AppSize.s12.h),
                        itemCount: items.length,
                      ),
                    ),
                    TotalPriceAndCheckoutBotton(
                      totalPrice:totalPrice ,
                      checkoutButtonOnTap: () {
                        // TODO: Handle checkout
                      },
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              );
            }
            else if (state is GetCartError) {
              return Center(child: Text(state.errorMessage));
            } else {
              return ListView.separated(
                padding: const EdgeInsets.all(AppPadding.p14),
                itemBuilder: (context, index) => const CartItemShimmer(),
                separatorBuilder: (context, index) => SizedBox(height: AppSize.s20.h),
                itemCount: 7,
              );
            }
          },
        )
      ),
    );
  }
}




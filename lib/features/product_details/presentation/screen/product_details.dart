import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/data/model/products/product.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_color.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_description.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_item.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_label.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_size.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int counter = 1;

  void onIncrement(int x) {
    setState(() {
      counter = x + 1;
    });
  }

  void onDecrement(int x) {
    if (counter > 1) {
      setState(() {
        counter = x - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var totalPrice = (widget.product.priceAfterDiscount ?? 0) * counter;

    return Scaffold(
      backgroundColor: ColorManager.containerGray,
      appBar: AppBar(
        backgroundColor: ColorManager.containerGray,
        centerTitle: true,
        title: Text(
          'Product Details',
          style: getMediumStyle(color: ColorManager.appBarTitleColor)
              .copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(IconsAssets.icSearch),
                color: ColorManager.primary,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: ColorManager.primary,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ProductSlider(
              items: widget.product.images!
                  .map(
                    (e) => ProductItem(imageUrl: e,id:widget.product.id??"" ,),
                  )
                  .toList(),
              initialIndex: 0,
            ),
            SizedBox(
              height: 24.h,
            ),
            ProductLabel(
              product: widget.product,
            ),
            SizedBox(
              height: 16.h,
            ),
            ProductRating(
              product: widget.product,
              counter: counter,
              onDecrement: onDecrement,
              onIncrement: onIncrement,
            ),
            SizedBox(
              height: 16.h,
            ),
            ProductDescription(
                productDescription: widget.product.description ?? ""),
            ProductSize(
              size: const [35, 38, 39, 40],
              onSelected: () {},
            ),
            SizedBox(
              height: 20.h,
            ),
            Text('Color',
                style: getMediumStyle(color: ColorManager.appBarTitleColor)
                    .copyWith(fontSize: 18.sp)),
            ProductColor(color: const [
              Colors.red,
              Colors.blueAccent,
              Colors.green,
              Colors.yellow,
            ], onSelected: () {}),
            SizedBox(
              height: 48.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Total price',
                      style: getMediumStyle(
                              color: ColorManager.primary.withOpacity(.6))
                          .copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text('EGP $totalPrice',
                        style:
                            getMediumStyle(color: ColorManager.appBarTitleColor)
                                .copyWith(fontSize: 18.sp))
                  ],
                ),
                SizedBox(
                  width: 33.w,
                ),
                Expanded(
                  child: CustomElevatedButton(
                    label: 'Add to cart',
                    onTap: () {
                      Navigator.pushNamed(context, Routes.cartRoute,
                          arguments: {widget.product, counter});
                    },
                    prefixIcon: Icon(
                      Icons.add_shopping_cart_outlined,
                      color: ColorManager.white,
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

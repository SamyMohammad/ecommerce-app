import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:ecommerce_app/data/model/products/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.onTap, required this.imageUrl, required this.id});

  final void Function()? onTap;
  final  String id;

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, image) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        height: 300.h,
        decoration: BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15.r),
        ),
        alignment: Alignment.topRight,
        child: HeartButton(
        id:id ,
        ),
      ),
    );
  }
}

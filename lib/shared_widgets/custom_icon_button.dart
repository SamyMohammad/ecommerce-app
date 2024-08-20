import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({this.onTap, required this.isFavorite  , super.key});

  final void Function()? onTap;
  final bool isFavorite ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        isFavorite ?  ImageAssets.favoriteIcon : ImageAssets.notFavoriteIcon,
        height: AppSize.s40.h,
        width: AppSize.s40.w,
        fit: BoxFit.fill,
      ),
    );
  }
}

import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/data/model/sub_category_model/SubCategory.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/Products_catalog_argument.dart';
import 'package:flutter/material.dart';


class SubCategoryItem extends StatelessWidget {
 SubCategory subCategory;
  final Function navigation;
   SubCategoryItem(this.subCategory, this.navigation, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.productsScreenRoute,
            arguments: ProductsCatalogArgument(
                subCategory: subCategory.id
            ));

      },
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s12),
                  border: Border.all(color: ColorManager.primary, width: 2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s10),
                child: Image.asset(
                  ImageAssets.categoryCardImage,
                  fit: BoxFit.cover,

                ),
              ),
            ),
          ),
          Text(
            subCategory.name??"",
            style: getRegularStyle(color: ColorManager.primary),
          )
        ],
      ),
    );
  }
}

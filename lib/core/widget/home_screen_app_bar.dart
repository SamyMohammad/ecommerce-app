import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      title: SvgPicture.asset(SvgAssets.routeLogo),
      bottom: PreferredSize(
          preferredSize: const Size(AppSize.s100, AppSize.s60),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: ColorManager.primary,
                    style: getRegularStyle(color: ColorManager.primary, fontSize: FontSize.s16),
                    decoration: InputDecoration(
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(width: AppSize.s1 , color: ColorManager.primary)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(width: AppSize.s1 , color: ColorManager.primary)
                      ),
                      disabledBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(width: AppSize.s1 , color: ColorManager.primary)
                      ),
                      focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(width: AppSize.s1 , color: ColorManager.primary)
                      ),
                      errorBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10000),
                          borderSide: BorderSide(width: AppSize.s1 ,color: ColorManager.error)
                      ),
                      prefixIcon: ImageIcon(AssetImage(IconsAssets.icSearch) , color: ColorManager.primary,),
                      hintText: "what do you search for?",
                      hintStyle: getRegularStyle(color: ColorManager.primary, fontSize: FontSize.s16),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      AssetImage(IconsAssets.icCart),
                      color: ColorManager.primary,
                    ))
              ],
            ),
          )),
    );
  }

  @override
  Size get preferredSize => const Size(AppSize.s100, AppSize.s100);
}

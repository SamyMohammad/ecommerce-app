import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CategoryCardItem extends StatelessWidget {
  final String title;
  final String image;
  final Function navigation;

  const CategoryCardItem(this.title, this.image, this.navigation, {super.key});

  @override
  Widget build(BuildContext context) {
    // Create a container for the category card
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSize.s16),
      // Height of the card set with fixed size to make all image same size but it can be deleted without affecting the code
      height: AppSize.s120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.s12),
        child: Stack(
          children: [
            // Background image for the category
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            // Overlay with category title and button
            Positioned.fill(
                child: Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Category title
                      Text(
                        title,
                        style: getSemiBoldStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s16),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Shop Now button
                      ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(AppPadding.p12)),
                              backgroundColor:
                                  MaterialStateProperty.all(ColorManager.primary),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(AppSize.s8)))),
                          child: Text(
                            "Shop Now",
                            style: getRegularStyle(color: ColorManager.white),
                          ))
                    ],
                  )),
                  const Spacer()
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

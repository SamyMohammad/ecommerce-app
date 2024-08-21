import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manager.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  final List<Widget> _images = [
    Image.asset(ImageAssets.carouselSlider1),
    Image.asset(ImageAssets.carouselSlider2),
    Image.asset(ImageAssets.carouselSlider3),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: _images,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2,
            enlargeCenterPage: true,
          ),
        ),
        // SizedBox(height: 12.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: getMediumStyle(
                      fontSize: 18,
                      color: ColorManager.darkBlue,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'view all',
                      style: getMediumStyle(color: ColorManager.darkBlue),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

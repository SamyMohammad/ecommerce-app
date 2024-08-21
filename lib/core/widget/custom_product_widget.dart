import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;

  const CustomCard({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
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
    if (words.length <= 3) {
      return description;
    } else {
      return "${words.sublist(0, 3).join(' ')}..";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.4,
      height: height * 0.34,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.primary.withOpacity(0.3),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
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
                Image.asset(image, fit: BoxFit.cover),
                Positioned(
                  top: height * 0.01,
                  right: width * 0.02,
                  child: Container(
                    height: height * 0.036,
                    width: width * 0.08,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      IconsAssets.icWithList,
                      color: ColorManager.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    truncateTitle(title),
                    style: getMediumStyle(
                      color: ColorManager.primary,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: height * 0.002),
                  Text(
                    truncateDescription(description),
                    style: getRegularStyle(
                      color: ColorManager.primary,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  SizedBox(
                    width: width * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$price",
                          style: getMediumStyle(
                            color: ColorManager.primary,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          "$discountPercentage %",
                          style: getTextWithLine(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Review ($rating)",
                                style: getRegularStyle(
                                  color: ColorManager.primary,
                                  fontSize: 14.sp,
                                ),
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
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: height * 0.036,
                          width: width * 0.08,
                          color: Theme.of(context).primaryColor,
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
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
    );
  }
}

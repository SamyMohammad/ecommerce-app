import 'dart:async';
import 'package:ecommerce_app/features/main_layout/home/presentation/manger/brand_cubit/brand_cubit.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/manger/category_cubit/category_cubit.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/product_card.dart';
import '../../../../domain/repos/HomeRepo/home_repo.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context) =>CategoryCubit(getIt<HomeRepo>())..loadCategory() ,),
        BlocProvider(create:(context) =>BrandCubit(getIt<HomeRepo>())..loadBrand() ,),

      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAdsWidget(
              adsImages: adsImages,
              currentIndex: _currentIndex,
              timer: _timer,
            ),
            Column(
              children: [
                CustomSectionBar(sectionNname: 'Categories', function: () {}),
                BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {

                    if (state is CategoryError) {

                      return Center(child: Text(state.errorMessage),);
                    } else if (state is CategorySuccess) {


                      final categories = state.category;
                      return SizedBox(
                        height: 270.h,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomCategoryWidget(
                              category: categories[index],);
                          },
                          itemCount: state.category.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),
                SizedBox(height: 12.h),
                CustomSectionBar(sectionNname: 'Brands', function: () {}),
                BlocBuilder<BrandCubit, BrandState>(
                  builder: (context, state) {
                    if(state is BrandError){
                         return Center(child: Text(state.errorMessage),);
                    }
                    else if(state is BrandSuccess){
                      final brands=state.brand;
                      return SizedBox(

                        height: 270.h,
                        child: GridView.builder(

                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return  CustomBrandWidget(brand: brands[index],);
                          },
                          itemCount: brands.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                        ),
                      );

                    }else{
                      return const Center(child: CircularProgressIndicator(),);
                    }

                  },
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
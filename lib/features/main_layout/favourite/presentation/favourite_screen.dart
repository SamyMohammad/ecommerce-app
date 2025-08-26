import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/main_layout/favourite/manger/wash_list_cubit.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widget/custom_shimmer_item.dart';
import '../../../cart/screens/cart_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<WashListCubit>()
        ..getWashList(),
      child: BlocBuilder<WashListCubit, WashListState>(
        builder: (context, state) {
          if (state is WashListLoading) {
            return ListView.separated(
              padding: const EdgeInsets.all(AppPadding.p14),
              itemBuilder: (context, index) => const CartItemShimmer(),
              separatorBuilder: (context, index) => SizedBox(height: AppSize.s20.h),
              itemCount: 5, // عدد العناصر الوهمية أثناء التحميل
            );
          } else if (state is WashListError) {
            return Center(child: Text(state.errorMessage));
          } else if (state is WashListSuccess) {
            final products = state.product;

            if (products.isEmpty) {
              return const Center(child: Text("No favorite products found."));
            }

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.s14.w,
                vertical: AppSize.s10.h,
              ),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                    child: FavoriteItem(product: products[index]),
                  );
                },
              ),
            );
          }

          // في حالة غير متوقعة
          return const Center(child: Text("Something went wrong."));
        },
      ),
    );
  }}
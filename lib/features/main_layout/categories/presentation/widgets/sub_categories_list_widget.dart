import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/data/model/categories_models/category.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/manger/sub_Categories_cubit/sub_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_category_item.dart';
//
// class SubCategoriesListWidget extends StatefulWidget {
//   Category category;
//
//   SubCategoriesListWidget(this.category, {super.key});
//
//   @override
//   State<SubCategoriesListWidget> createState() => _SubCategoriesListWidgetState();
// }
//
// class _SubCategoriesListWidgetState extends State<SubCategoriesListWidget> {
//   late SubCategoryCubit _cubit;
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     // لازم نحفظ الكيوبت من الـ context عشان نستخدمه بعدين
//     _cubit = context.read<SubCategoryCubit>();
//   }
//   @override
//   void didUpdateWidget(covariant SubCategoriesListWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//
//     if (oldWidget.category.id != widget.category.id) {
//       _cubit.loadSubCategory(widget.category.id!);
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: 2,
//       child: CustomScrollView(
//         slivers: <Widget>[
//           // category title
//           SliverToBoxAdapter(
//             child: Text(
//               " ${widget.category.name}",
//               style: getBoldStyle(
//                   color: ColorManager.primary, fontSize: FontSize.s14),
//             ),
//           ),
//           // the category card
//           SliverToBoxAdapter(
//             child: CategoryCardItem("Laptops & Electronics",
//                 ImageAssets.categoryCardImage,
//                 goToCategoryProductsListScreen),
//           ),
//           // the grid view of the subcategories
//           BlocBuilder<SubCategoryCubit, SubCategoryState>(
//             builder: (context, state) {
//               if (state is SubCategorySuccess) {
//                 var subCategory = state.subCategory;
//                 return SliverGrid(
//                     delegate: SliverChildBuilderDelegate(
//                       childCount: subCategory.length,
//                           (context, index) =>
//                           SubCategoryItem(
//                               subCategory[index],
//                               goToCategoryProductsListScreen),
//                     ),
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       childAspectRatio: 0.75,
//                       mainAxisSpacing: AppSize.s8,
//                       crossAxisSpacing: AppSize.s8,
//                     ));
//               } else if (state is SubCategoryError) {
//                 return SliverToBoxAdapter(child: Center(child: Text(state.errorMessage),));
//               } else {
//                 return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(),));
//               }
//             },
//           )
//         ],
//       ),
//     );
//   }
//
//   goToCategoryProductsListScreen() {
//     // todo implement this function
//   }
// }
class SubCategoriesListWidget extends StatelessWidget {
  final Category category;
  const SubCategoriesListWidget(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Text(
              " ${category.name}",
              style: getBoldStyle(
                  color: ColorManager.primary, fontSize: FontSize.s14),
            ),
          ),
          // Other UI like CategoryCardItem here...

          BlocBuilder<SubCategoryCubit, SubCategoryState>(
            builder: (context, state) {
              if (state is SubCategorySuccess) {
                final subCategory = state.subCategory;

                return SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: subCategory.length,
                        (context, index) => SubCategoryItem(
                        subCategory[index], goToCategoryProductsListScreen,
                       ),
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisSpacing: AppSize.s8,
                    crossAxisSpacing: AppSize.s8,
                  ),
                );
              }else if(state is SubCategoryEmpty){
                return const SliverToBoxAdapter(
                    child: Center(child: Text("Empty Item")));
              }

              else if (state is SubCategoryError) {
                return SliverToBoxAdapter(
                    child: Center(child: Text(state.errorMessage)));
              } else {
                return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()));
              }
            },
          ),
        ],
      ),
    );
  }

  void goToCategoryProductsListScreen() {
    // TODO: implement navigation
  }
}

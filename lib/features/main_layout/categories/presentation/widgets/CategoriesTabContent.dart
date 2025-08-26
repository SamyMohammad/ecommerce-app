// import 'package:ecommerce_app/data/model/categories_models/category.dart';
// import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/sub_categories_list_widget.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../../core/resources/values_manager.dart';
// import 'categories_list_widget.dart';
//
// class CategoriesTabContent extends StatefulWidget {
//    CategoriesTabContent(this.category,{super.key});
//
//   List<Category>category;
//
//   @override
//   State<CategoriesTabContent> createState() => _CategoriesTabContentState();
// }
//
// class _CategoriesTabContentState extends State<CategoriesTabContent> {
//   late Category selectedCategory;
//
//   @override
//   void initState() {
//
//     selectedCategory=widget.category[0];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//       CategoriesListWidget(widget.category??[],onCategoryItemSelected),
//         const SizedBox(
//           width: AppSize.s16,
//         ),
//         SubCategoriesListWidget(selectedCategory)
//       ],
//     );
//
//   }
//
//   void onCategoryItemSelected(Category category){
//
//     setState(() {
//       selectedCategory=category;
//     });
//
//
//
//   }
// }
import 'package:ecommerce_app/data/model/categories_models/category.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/sub_categories_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/values_manager.dart';
import '../manger/sub_Categories_cubit/sub_category_cubit.dart';
import 'categories_list_widget.dart';

class CategoriesTabContent extends StatefulWidget {
  const CategoriesTabContent(this.category, {super.key});
  final List<Category> category;

  @override
  State<CategoriesTabContent> createState() => _CategoriesTabContentState();
}

class _CategoriesTabContentState extends State<CategoriesTabContent> {
  late Category selectedCategory;
  late SubCategoryCubit subCategoryCubit;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.category[0];
    //subCategoryCubit = SubCategoryCubit(getIt<SubCategoryRepo>());
   // subCategoryCubit.loadSubCategory(selectedCategory.id!); // أول تحميل
  }

  @override
  void dispose() {
   // subCategoryCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CategoriesListWidget(widget.category, onCategoryItemSelected),
        const SizedBox(width: AppSize.s16),
        SubCategoriesListWidget(selectedCategory),
      ],
    );
  }

  void onCategoryItemSelected(Category category) {
    setState(() {
      selectedCategory = category;
    });

   // subCategoryCubit.loadSubCategory(category.id!); // ← إعادة تحميل البيانات
    context.read<SubCategoryCubit>().loadSubCategory(selectedCategory.id!);
  }
}

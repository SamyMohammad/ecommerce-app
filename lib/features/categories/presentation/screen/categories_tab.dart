import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/widget/home_screen_app_bar.dart';
import 'package:ecommerce_app/features/categories/presentation/widgets/categories_list.dart';
import 'package:flutter/material.dart';

import '../widgets/sub_categories_list.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeScreenAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
        child: Row(
          children: [
            CategoriesList(),
            const SizedBox(width: AppSize.s16,),
            const SubCategoriesList()
          ],
        ),
      ),
    );
  }
}

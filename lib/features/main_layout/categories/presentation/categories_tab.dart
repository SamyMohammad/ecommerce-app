import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/domain/repos/HomeRepo/home_repo.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/CategoriesTabContent.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/manger/category_cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../domain/repos/subCategoriesRepo/sub_category_repo.dart';
import 'manger/sub_Categories_cubit/sub_category_cubit.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab( {super.key});



  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>
        CategoryCubit(getIt<HomeRepo>())
          ..loadCategory(),),
        BlocProvider(create: (_) => SubCategoryCubit(getIt<SubCategoryRepo>())),

      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12, vertical: AppPadding.p12),
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if(state is CategorySuccess){
              return CategoriesTabContent(state.category,);
            }
            else if(state is CategoryError){
              return Center(child: Text(state.errorMessage),);
            }else{
              return const Center(child: CircularProgressIndicator(),);
            }

          },
        ),
      ),
    );
  }
}

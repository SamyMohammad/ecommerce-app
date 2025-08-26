import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/data/model/categories_models/category.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/manger/category_cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
typedef OnCategoryItemSelected=void Function(Category);
class CategoriesListWidget extends StatefulWidget {
  List<Category>category;
   CategoriesListWidget( this.category,this.onCategoryItemSelected,{super.key});
   OnCategoryItemSelected onCategoryItemSelected;


  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  // Index of the currently selected category
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.containerGray,
            border: Border(
              // set the border for only 3 sides
                top: BorderSide(
                    width: AppSize.s2,
                    color: ColorManager.primary.withOpacity(0.3)),
                left: BorderSide(
                    width: AppSize.s2,
                    color: ColorManager.primary.withOpacity(0.3)),
                bottom: BorderSide(
                    width: AppSize.s2,
                    color: ColorManager.primary.withOpacity(0.3))),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppSize.s12),
              bottomLeft: Radius.circular(AppSize.s12),
            ),
          ),

          // the categories items list
          child: ClipRRect(
            // clip the corners of the container that hold the list view
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppSize.s12),
              bottomLeft: Radius.circular(AppSize.s12),
            ),
            child:ListView.builder(
              itemCount: widget.category.length,
              itemBuilder: (context, index) =>
                  CategoryItem(index,
                      widget.category[index].name??"", selectedIndex == index,
                      onItemClick),
            )
            ),
          ),
        );
  }

  // callback function to change the selected index
  onItemClick(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onCategoryItemSelected(widget.category[index]);
  }
}

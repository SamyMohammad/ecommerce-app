import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/presentation/home/tabs/categories_tap/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {


  CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {

  // Index of the currently selected category
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ClipRRect(
          // clip the corners of the container that hold the list view
          borderRadius:const BorderRadius.only(
            topLeft: Radius.circular(AppSize.s12),
            bottomLeft: Radius.circular(AppSize.s12),
            bottomRight: Radius.circular(AppSize.s12),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.containerGray,
              border: Border(
                // set the border for only 3 sides
                top: BorderSide(width: AppSize.s2 , color: ColorManager.primary.withOpacity(0.3)),
                left: BorderSide(width: AppSize.s2 , color: ColorManager.primary.withOpacity(0.3)),
                bottom: BorderSide(width: AppSize.s2 , color: ColorManager.primary.withOpacity(0.3))
              ),
            ),

            // the categories items list
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) =>
                  CategoryItem(
                      index,
                      "Laptops & Electronics" ,
                      selectedIndex == index ,
                      onItemClick
                  ) ,
            ),
          ),
        )
    );
  }

  // callback function to change the selected index
  onItemClick(int index){
    setState(() {
      selectedIndex = index;
    });
  }
}

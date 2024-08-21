import 'package:ecommerce_app/features/product_details/presentation/widgets/color_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductColor extends StatefulWidget {
  final List<Color> color;
  final void Function() onSelected;
  const ProductColor({super.key , required this.color , required this.onSelected});

  @override
  State<ProductColor> createState() => _ProductColorState();
}

class _ProductColorState extends State<ProductColor> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h,),
        SizedBox(
          height: 45.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder: (context , index){
              return GestureDetector(
                onTap: (){
                  setState(() {
                    selected = index;
                  });
                  widget.onSelected.call();
                },
                child: ColorItem(
                  color: widget.color[index],
                  index: index,
                  selectedIndex: selected,
                ),
              );
              },
              separatorBuilder: (context , index)=>SizedBox(width: 17.w,),
              itemCount: widget.color.length),
        ),
      ],
    );
  }
}

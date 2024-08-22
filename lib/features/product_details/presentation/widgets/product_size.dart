import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/size_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSize extends StatefulWidget {
  final List<int> size;
  final void Function() onSelected;
  const ProductSize({super.key , required this.size , required this.onSelected});

  @override
  State<ProductSize> createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Size',
            style: getMediumStyle(color: ColorManager.appBarTitleColor)
                .copyWith(fontSize: 18.sp)
        ),
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
                child: SizeWidget(
                  index: index,
                    selectedIndex: selected,
                    sizeNumber: widget.size[index]),
              );
              },
              separatorBuilder: (context , index)=>SizedBox(width: 17.w,),
              itemCount: widget.size.length),
        ),
      ],
    );
  }
}


import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:flutter/material.dart';

class HeatButton extends StatefulWidget {
  final void Function()? onTap;
  const HeatButton({super.key , required this.onTap});

  @override
  State<HeatButton> createState() => _HeatButtonState();
}

class _HeatButtonState extends State<HeatButton> {
  String heartIcon = IconsAssets.icHeart;
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          isClicked = !isClicked;
          heartIcon = !isClicked ? IconsAssets.icHeart : IconsAssets.icClickedHeart;
          widget.onTap?.call();
        });
      },
      child:  Material(
        color: ColorManager.white,
        elevation: 5,
        shape: const StadiumBorder(),
        shadowColor: ColorManager.black,
        child:  Padding(
            padding: const EdgeInsets.all(6),
            child: ImageIcon( AssetImage(heartIcon) , color: ColorManager.primary,)),
      ),
    );
  }
}
